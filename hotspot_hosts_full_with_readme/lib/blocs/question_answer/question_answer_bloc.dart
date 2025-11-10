import 'package:flutter_bloc/flutter_bloc.dart';
import 'question_answer_event.dart';
import 'question_answer_state.dart';

class QuestionAnswerBloc extends Bloc<QAEvent, QAState> {
  QuestionAnswerBloc() : super(QAState()) {
    on<TextChanged>((e, emit) => emit(state.copyWith(text: e.text)));
    on<AudioAdded>((e, emit) => emit(state.copyWith(audioPath: e.path)));
    on<VideoAdded>((e, emit) => emit(state.copyWith(videoPath: e.path)));
    on<AudioRemoved>((e, emit) => emit(state.copyWith(audioPath: null)));
    on<VideoRemoved>((e, emit) => emit(state.copyWith(videoPath: null)));
  }
}
