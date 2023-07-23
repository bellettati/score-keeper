import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/index.dart';

class EditTeamView extends StatefulWidget {
  final int teamIndex;

  const EditTeamView({
    super.key,
    required this.teamIndex,
  });

  @override
  State<EditTeamView> createState() => _EditTeamViewState();
}

class _EditTeamViewState extends State<EditTeamView> {
  late final TextEditingController _controller;
  final teamBook = TeamBook();

  @override
  void initState() {
    _controller = TextEditingController();
    final team = teamBook.team(atIndex: widget.teamIndex);
    if (team != null) {
      _controller.text = team.name;
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 42, 45, 54),
        leading: IconButton(
          onPressed: () => context.go('/teams'),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textAlign: TextAlign.center,
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Team Name...',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 54, 57, 66),
              ),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (_controller.text.isEmpty) return;
              final teamIndex = widget.teamIndex;
              final teamName = _controller.text;

              teamBook.editName(atIndex: teamIndex, teamName: teamName);

              context.go('/teams');
            },
            child: const Text(
              'EDIT TEAM',
            ),
          )
        ],
      ),
    );
  }
}
