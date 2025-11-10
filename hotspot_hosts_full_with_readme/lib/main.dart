import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/app_theme.dart';
import 'screens/experience_selection_screen.dart';
import 'screens/question_screen.dart';
import 'blocs/experience/experience_bloc.dart';
import 'blocs/selection/selection_bloc.dart';
import 'blocs/question_answer/question_answer_bloc.dart';
import 'services/api_service.dart';
import 'repositories/experience_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<ExperienceRepository>(ExperienceRepository(getIt<ApiService>()));
}

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ExperienceBloc(getIt<ExperienceRepository>())..add(FetchExperiences())),
        BlocProvider(create: (_) => SelectionBloc()),
        BlocProvider(create: (_) => QuestionAnswerBloc()),
      ],
      child: MaterialApp(
        title: 'Hotspot Hosts',
        theme: AppTheme.lightTheme,
        initialRoute: '/',
        routes: {
          '/': (_) => const ExperienceSelectionScreen(),
          '/question': (_) => const QuestionScreen(),
        },
      ),
    );
  }
}
