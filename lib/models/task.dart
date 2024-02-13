import 'package:flutter/services.dart';
import 'dart:convert';

class Task {
  int id;
  String title;
  List<String> tags;
  int nbhours;
  int difficulty;
  String description;

  Task({
    required this.id,
    required this.title,
    required this.tags,
    required this.nbhours,
    required this.difficulty,
    required this.description,
  });

  static List<Task> generateTask(int i) {
    List<Task> tasks = [];
    for (int n = 0; n < i; n++) {
      tasks.add(Task(
        id: n,
        title: "title $n",
        tags: ['tag $n', 'tag ${n + 1}'],
        nbhours: n,
        difficulty: n,
        description: '$n',
      ));
    }
    return tasks;
  }


  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id']?? "inconnu",
      title: json['title'],
      tags: List<String>.from(json['tags']),
      nbhours: json['nbhours'],
      difficulty: json['difficulty']?? -1,
      description: json['description']?? "inconnu",
    );
  }

}

