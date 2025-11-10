import 'package:equatable/equatable.dart';
class SelectionState extends Equatable {
  final List<int> selectedIds;
  SelectionState(this.selectedIds);
  @override List<Object?> get props => [selectedIds];
}
