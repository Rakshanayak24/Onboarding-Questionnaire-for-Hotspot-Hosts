import 'package:flutter_bloc/flutter_bloc.dart';
import 'experience_event.dart';
import 'experience_state.dart';
import '../../repositories/experience_repository.dart';

class ExperienceBloc extends Bloc<ExperienceEvent, ExperienceState> {
  final ExperienceRepository repository;
  ExperienceBloc(this.repository) : super(ExperienceInitial()) {
    on<FetchExperiences>((e, emit) async {
      emit(ExperienceLoading());
      try {
        final list = await repository.getExperiences();
        emit(ExperienceLoaded(list));
      } catch (ex) {
        emit(ExperienceError(ex.toString()));
      }
    });
  }
}
