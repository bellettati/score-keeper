import 'package:uuid/uuid.dart';

class Team {
  final String id;
  String name;
  int points = 0;

  Team({
    required this.name,
  }) : id = const Uuid().v4();
}
