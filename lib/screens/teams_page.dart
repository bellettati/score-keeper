import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/index.dart';

class TeamsPage extends StatefulWidget {
  const TeamsPage({super.key});

  @override
  createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 42, 45, 54),
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 20,
            child: ValueListenableBuilder(
              valueListenable: TeamBook(),
              builder: (context, value, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final team = value[index];
                    return TeamCard(
                      handleDelete: () => TeamBook().remove(team: team),
                      handleEdit: () => context.go('/edit-team/$index'),
                      teamName: team.name,
                    );
                  },
                  itemCount: value.length,
                );
              },
            ),
          ),
          Expanded(
            flex: 4,
            child: TeamPageOptions(
              handleAddTeam: () => context.go('/new-team'),
            ),
          ),
        ],
      ),
    );
  }
}

class TeamPageOptions extends StatelessWidget {
  final VoidCallback handleAddTeam;

  const TeamPageOptions({
    super.key,
    required this.handleAddTeam,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
          child: Container(
            color: const Color.fromARGB(255, 42, 45, 54),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: handleAddTeam,
                child: const Text(
                  'ADD TEAM',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
          child: Container(
            color: const Color.fromARGB(255, 42, 45, 54),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () => context.go('/match'),
                child: const Text(
                  'START MATCH',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TeamCard extends StatelessWidget {
  final VoidCallback handleDelete;
  final VoidCallback handleEdit;
  final String teamName;

  const TeamCard({
    super.key,
    required this.handleDelete,
    required this.handleEdit,
    required this.teamName,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth * 0.9;
    final optionWidth = screenWidth * 0.445;
    final spacing = screenWidth * 0.01;
    const editOptionBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(5),
      topRight: Radius.circular(5),
      bottomLeft: Radius.circular(15),
      bottomRight: Radius.circular(5),
    );
    const deleteOptionBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(5),
      topRight: Radius.circular(5),
      bottomLeft: Radius.circular(5),
      bottomRight: Radius.circular(15),
    );
    const Color optionIconColor = Colors.white;
    const double optionIconSize = 40;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: Column(
        children: [
          Container(
            width: containerWidth,
            height: 130,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: screenWidth * 0.8,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 253, 110, 100),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  child: Center(
                    child: Text(
                      teamName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: spacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TeamCardOption(
                handleOnTap: handleEdit,
                width: optionWidth,
                borderRadius: editOptionBorderRadius,
                icon: const Icon(
                  Icons.edit,
                  color: optionIconColor,
                  size: optionIconSize,
                ),
              ),
              SizedBox(width: spacing),
              TeamCardOption(
                handleOnTap: handleDelete,
                width: optionWidth,
                borderRadius: deleteOptionBorderRadius,
                icon: const Icon(
                  Icons.delete,
                  color: optionIconColor,
                  size: optionIconSize,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TeamCardOption extends StatelessWidget {
  final VoidCallback handleOnTap;
  final double width;
  final BorderRadius borderRadius;
  final Icon icon;

  const TeamCardOption({
    super.key,
    required this.handleOnTap,
    required this.width,
    required this.borderRadius,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: handleOnTap,
      child: Ink(
        width: width,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: borderRadius,
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
