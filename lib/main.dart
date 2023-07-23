import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './screens/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LandingPage(),
      ),
      GoRoute(
        path: '/teams',
        builder: (context, state) => const TeamsPage(),
      ),
      GoRoute(
        path: '/new-team',
        builder: (context, state) => const NewTeamView(),
      ),
      GoRoute(
        path: '/edit-team/:index',
        builder: (context, state) {
          final index = int.parse(state.pathParameters['index']!);
          return EditTeamView(teamIndex: index);
        },
      ),
      GoRoute(
        path: '/edit-team-points/:index/:operation',
        builder: (context, state) {
          final index = int.parse(state.pathParameters['index']!);
          final operation = state.pathParameters['operation']!;
          return EditTeamPointsPage(teamIndex: index, operation: operation);
        },
      ),
      GoRoute(
        path: '/match',
        builder: (context, state) => const MatchPage(),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(accentColor: Colors.blue).copyWith(
          background: const Color.fromARGB(255, 42, 45, 54),
        ),
      ),
    );
  }
}
