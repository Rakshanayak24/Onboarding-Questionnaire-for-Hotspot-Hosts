import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/experience/experience_bloc.dart';
import '../blocs/experience/experience_state.dart';
import '../blocs/selection/selection_bloc.dart';
import '../blocs/selection/selection_state.dart';
import '../widgets/experience_stamp_card.dart';
import '../models/experience.dart';

class ExperienceSelectionScreen extends StatelessWidget {
  const ExperienceSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Experiences')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          Expanded(child: BlocBuilder<ExperienceBloc, ExperienceState>(
            builder: (context, state) {
              if (state is ExperienceLoading) return const Center(child: CircularProgressIndicator());
              if (state is ExperienceLoaded) {
                final list = state.experiences;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75, crossAxisSpacing: 12, mainAxisSpacing: 12),
                  itemCount: list.length,
                  itemBuilder: (c, i) {
                    final exp = list[i];
                    return BlocBuilder<SelectionBloc, SelectionState>(
                      builder: (context, selState) {
                        final selected = selState.selectedIds.contains(exp.id);
                        return ExperienceStampCard(experience: exp, selected: selected, onTap: () {
                          context.read<SelectionBloc>().add(ToggleSelection(exp.id));
                        });
                      },
                    );
                  },
                );
              }
              if (state is ExperienceError) return Center(child: Text('Error: ${state.message}'));
              return const SizedBox.shrink();
            },
          )),
          const SizedBox(height: 12),
          _NotesInput(),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: ElevatedButton(onPressed: () {
              // simple validation: at least one selection
              final sel = context.read<SelectionBloc>().state.selectedIds;
              if (sel.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Select at least one experience')));
                return;
              }
              Navigator.of(context).pushNamed('/question');
            }, child: const Text('Next')))
          ])
        ]),
      ),
    );
  }
}

class _NotesInput extends StatefulWidget {
  @override State<_NotesInput> createState() => _NotesInputState();
}

class _NotesInputState extends State<_NotesInput> {
  final controller = TextEditingController();
  @override Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 3,
      maxLength: 250,
      decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Notes (250 chars)'),
    );
  }
  @override void dispose() { controller.dispose(); super.dispose(); }
}
