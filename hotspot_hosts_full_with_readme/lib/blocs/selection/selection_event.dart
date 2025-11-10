import 'package:equatable/equatable.dart';
abstract class SelectionEvent extends Equatable { @override List<Object?> get props => []; }
class ToggleSelection extends SelectionEvent {
  final int id; ToggleSelection(this.id);
  @override List<Object?> get props => [id];
}
class ClearSelection extends SelectionEvent {}
