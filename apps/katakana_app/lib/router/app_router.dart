import 'package:go_router/go_router.dart';
import 'package:katakana_app/features/home/home_screen.dart';
import 'package:katakana_app/features/settings/settings_screen.dart';
import 'package:katakana_app/features/katakana_table/katakana_table_screen.dart';
import 'package:katakana_app/features/practice/practice_screen.dart';
import 'package:katakana_app/features/quiz/quiz_screen.dart';
import 'package:katakana_app/features/write/write_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/katakana-table',
      builder: (context, state) => const KatakanaTableScreen(),
    ),
    GoRoute(
      path: '/practice',
      builder: (context, state) => const PracticeScreen(),
    ),
    GoRoute(
      path: '/quiz',
      builder: (context, state) => const QuizScreen(),
    ),
    GoRoute(
      path: '/write',
      builder: (context, state) => const WriteScreen(),
    ),
  ],
);
