import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MatchButtonWidget(),
            SizedBox(height: 5),
            TournamentButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class MatchButtonWidget extends StatelessWidget {
  const MatchButtonWidget({super.key});

  final BorderRadius borderRadius = const BorderRadius.only(
    topLeft: Radius.circular(15),
    topRight: Radius.circular(15),
    bottomLeft: Radius.circular(5),
    bottomRight: Radius.circular(5),
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go('/teams'),
      borderRadius: borderRadius,
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: borderRadius,
        ),
        child: const FractionallySizedBox(
          widthFactor: 0.8,
          child: SizedBox(
            height: 100,
            child: Center(
              child: Text(
                'MATCH',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TournamentButtonWidget extends StatelessWidget {
  const TournamentButtonWidget({super.key});

  final BorderRadius borderRadius = const BorderRadius.only(
    topLeft: Radius.circular(5),
    topRight: Radius.circular(5),
    bottomLeft: Radius.circular(15),
    bottomRight: Radius.circular(15),
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: borderRadius,
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: borderRadius,
        ),
        child: const FractionallySizedBox(
          widthFactor: 0.8,
          child: SizedBox(
            height: 100,
            child: Center(
              child: Text(
                'TOURNAMENT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
