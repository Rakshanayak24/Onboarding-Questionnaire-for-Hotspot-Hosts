import 'package:equatable/equatable.dart';
import '../../models/experience.dart';

abstract class ExperienceState extends Equatable {
  @override List<Object?> get props => [];
}

class ExperienceInitial extends ExperienceState {}
class ExperienceLoading extends ExperienceState {}
class ExperienceLoaded extends ExperienceState {
  final List<Experience> experiences;
  ExperienceLoaded(this.experiences);
  @override List<Object?> get props => [experiences];
}
class ExperienceError extends ExperienceState {
  final String message;
  ExperienceError(this.message);
  @override List<Object?> get props => [message];
}
