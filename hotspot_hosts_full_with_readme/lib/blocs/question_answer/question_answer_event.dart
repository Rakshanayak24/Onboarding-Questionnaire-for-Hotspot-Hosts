import 'package:equatable/equatable.dart';
abstract class QAEvent extends Equatable { @override List<Object?> get props => []; }
class TextChanged extends QAEvent { final String text; TextChanged(this.text); @override List<Object?> get props => [text]; }
class AudioAdded extends QAEvent { final String path; AudioAdded(this.path); @override List<Object?> get props => [path]; }
class VideoAdded extends QAEvent { final String path; VideoAdded(this.path); @override List<Object?> get props => [path]; }
class AudioRemoved extends QAEvent {}
class VideoRemoved extends QAEvent {}
