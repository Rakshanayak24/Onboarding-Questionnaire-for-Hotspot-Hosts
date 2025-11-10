import 'package:flutter_bloc/flutter_bloc.dart';
import 'selection_event.dart';
import 'selection_state.dart';

class SelectionBloc extends Bloc<SelectionEvent, SelectionState> {
  SelectionBloc() : super(SelectionState([])) {
    on<ToggleSelection>((e, emit) {
      final cur = List<int>.from(state.selectedIds);
      if (cur.contains(e.id)) cur.remove(e.id); else cur.add(e.id);
      emit(SelectionState(cur));
    });
    on<ClearSelection>((e, emit) => emit(SelectionState([])));
  }
}
