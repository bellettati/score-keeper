import 'package:blitz/models/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditTeamPointsPage extends StatefulWidget {
  final int teamIndex;
  final String operation;
  const EditTeamPointsPage({
    super.key,
    required this.teamIndex,
    required this.operation,
  });

  @override
  State<EditTeamPointsPage> createState() => _EditTeamPointsPageState();
}

class _EditTeamPointsPageState extends State<EditTeamPointsPage> {
  late final TextEditingController _controller;
  final teamBook = TeamBook();

  @override
  void initState() {
    _controller = TextEditingController();
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
          onPressed: () => context.go('/match'),
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
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              controller: _controller,
              decoration: InputDecoration(
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
                fontSize: 30,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              if (_controller.text.isEmpty) return;
              final teamIndex = widget.teamIndex;
              final points = int.parse(_controller.text);

              if (widget.operation == 'add') {
                teamBook.addPoints(
                  atIndex: teamIndex,
                  pointsToAdd: points,
                );
              } else {
                teamBook.subtractPoints(
                  atIndex: teamIndex,
                  pointsToSubtract: points,
                );
              }

              context.go('/match');
            },
            icon: widget.operation == 'add'
                ? const Icon(
                    Icons.add,
                    color: Colors.blue,
                    size: 40,
                  )
                : const Icon(
                    Icons.remove,
                    color: Colors.red,
                    size: 40,
                  ),
          )
        ],
      ),
    );
  }
}
