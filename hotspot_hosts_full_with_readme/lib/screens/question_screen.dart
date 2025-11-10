import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/question_answer/question_answer_bloc.dart';
import '../blocs/question_answer/question_answer_event.dart';
import '../blocs/question_answer/question_answer_state.dart';
import '../utils/permission_helper.dart';
import 'package:record/record.dart';
import 'package:image_picker/image_picker.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});
  @override State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final _textController = TextEditingController();
  final _rec = Record();
  bool _isRecording = false;
  String? _audioPath;

  final ImagePicker _picker = ImagePicker();
  String? _videoPath;

  @override void dispose() { _textController.dispose(); super.dispose(); }

  Future<void> _toggleRecord() async {
    if (!_isRecording) {
      final ok = await PermissionHelper.requestMicrophone();
      if (!ok) return;
      final path = '/tmp/answer_${DateTime.now().millisecondsSinceEpoch}.m4a';
      await _rec.start(path: path);
      setState(() { _isRecording = true; });
    } else {
      final path = await _rec.stop();
      setState(() { _isRecording = false; _audioPath = path; });
      if (path != null) context.read<QuestionAnswerBloc>().add(AudioAdded(path));
    }
  }

  Future<void> _recordVideo() async {
    final ok = await PermissionHelper.requestCamera();
    if (!ok) return;
    final file = await _picker.pickVideo(source: ImageSource.camera, maxDuration: const Duration(minutes: 3));
    if (file != null) {
      setState(() { _videoPath = file.path; });
      context.read<QuestionAnswerBloc>().add(VideoAdded(file.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Question')), body: Padding(padding: const EdgeInsets.all(12), child:
      Column(children: [
        TextField(controller: _textController, maxLines: 6, maxLength: 600, decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Answer (600 chars)'), onChanged: (v) => context.read<QuestionAnswerBloc>().add(TextChanged(v))),
        const SizedBox(height: 12),
        if (_isRecording) Column(children: [Text('Recording...'), const SizedBox(height: 8), Row(children: [ElevatedButton.icon(onPressed: _toggleRecord, icon: const Icon(Icons.stop), label: const Text('Stop')), const SizedBox(width: 12), OutlinedButton(onPressed: () async { await _rec.stop(); setState((){_isRecording=false;}); }, child: const Text('Cancel'))])]),
        const SizedBox(height: 12),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          if (_audioPath == null && !_isRecording) ElevatedButton.icon(onPressed: _toggleRecord, icon: const Icon(Icons.mic), label: const Text('Record Audio')),
          if (_audioPath != null) Column(children: [const Text('Audio recorded'), TextButton(onPressed: () { setState(()=>_audioPath=null); context.read<QuestionAnswerBloc>().add(AudioRemoved()); }, child: const Text('Delete'))]),
          if (_videoPath == null) ElevatedButton.icon(onPressed: _recordVideo, icon: const Icon(Icons.videocam), label: const Text('Record Video')),
          if (_videoPath != null) Column(children: [const Text('Video recorded'), TextButton(onPressed: () { setState(()=>_videoPath=null); context.read<QuestionAnswerBloc>().add(VideoRemoved()); }, child: const Text('Delete'))]),
        ]),
        const Spacer(),
        AnimatedContainer(duration: const Duration(milliseconds: 300), width: (_audioPath!=null||_videoPath!=null)?200:double.infinity, child: ElevatedButton(onPressed: () {
          final state = context.read<QuestionAnswerBloc>().state;
          debugPrint('Submitted: text=${state.text}, audio=${state.audioPath}, video=${state.videoPath}');
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Submitted (check console)')));
        }, child: const Text('Submit')))
      ])
    ));
  }
}
