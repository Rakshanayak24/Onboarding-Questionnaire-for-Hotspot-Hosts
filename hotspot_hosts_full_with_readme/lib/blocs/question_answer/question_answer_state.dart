import 'package:equatable/equatable.dart';
class QAState extends Equatable {
  final String text;
  final String? audioPath;
  final String? videoPath;
  QAState({this.text = '', this.audioPath, this.videoPath});
  QAState copyWith({String? text, String? audioPath, String? videoPath}) => QAState(
    text: text ?? this.text, audioPath: audioPath ?? this.audioPath, videoPath: videoPath ?? this.videoPath);
  @override List<Object?> get props => [text, audioPath, videoPath];
}
