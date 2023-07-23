import 'package:blitz/models/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({super.key});

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go('/teams'),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 42, 45, 54),
      ),
      body: ValueListenableBuilder(
        valueListenable: TeamBook(),
        builder: (context, value, child) {
          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final team = value[index];
              return TeamMatchCard(
                handleAdd: () => context.go('/edit-team-points/$index/add'),
                handleSubtract: () =>
                    context.go('/edit-team-points/$index/sub'),
                team: team,
              );
            },
            itemCount: value.length,
          );
        },
      ),
    );
  }
}

class TeamMatchCard extends StatelessWidget {
  final Team team;
  final VoidCallback handleSubtract;
  final VoidCallback handleAdd;

  const TeamMatchCard({
    super.key,
    required this.handleAdd,
    required this.handleSubtract,
    required this.team,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.9;
    final spacing = screenWidth * 0.01;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: cardWidth,
            height: 180,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: screenWidth * 0.8,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 253, 110, 100),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          team.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 6,
                    child: SizedBox(
                      width: screenWidth * 0.8,
                      child: Center(
                        child: Text(
                          '${team.points}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: spacing,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TeamMatchCardOption(
                handleOnTap: handleAdd,
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 40,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(5),
                ),
              ),
              SizedBox(width: spacing),
              TeamMatchCardOption(
                handleOnTap: handleSubtract,
                icon: const Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 40,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TeamMatchCardOption extends StatelessWidget {
  final Icon icon;
  final BorderRadius borderRadius;
  final VoidCallback handleOnTap;

  const TeamMatchCardOption({
    super.key,
    required this.handleOnTap,
    required this.icon,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final optionWidth = screenWidth * 0.445;

    return InkWell(
      onTap: handleOnTap,
      child: Ink(
        width: optionWidth,
        height: 50,
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
