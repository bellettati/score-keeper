import 'package:blitz/models/index.dart';
import 'package:flutter/material.dart';

class TeamBook extends ValueNotifier<List<Team>> {
  TeamBook._sharedInstance() : super([]);
  static final TeamBook _shared = TeamBook._sharedInstance();
  factory TeamBook() => _shared;

  int get length => value.length;

  void add({required Team team}) {
    value.add(team);
    notifyListeners();
  }

  void remove({required Team team}) {
    if (value.contains(team)) {
      value.remove(team);
      notifyListeners();
    }
  }

  void editName({
    required int atIndex,
    required String teamName,
  }) {
    final teamToEdit = team(atIndex: atIndex);
    if (teamToEdit != null) {
      teamToEdit.name = teamName;
      notifyListeners();
    }
  }

  void subtractPoints({
    required int atIndex,
    required int pointsToSubtract,
  }) {
    final teamToEdit = team(atIndex: atIndex);
    if (teamToEdit != null) {
      teamToEdit.points -= pointsToSubtract;
      notifyListeners();
    }
  }

  void addPoints({
    required int atIndex,
    required int pointsToAdd,
  }) {
    final teamToEdit = team(atIndex: atIndex);
    if (teamToEdit != null) {
      teamToEdit.points += pointsToAdd;
      notifyListeners();
    }
  }

  Team? team({required int atIndex}) {
    final teamExists = atIndex >= 0 && atIndex < length;
    return teamExists ? value[atIndex] : null;
  }
}
