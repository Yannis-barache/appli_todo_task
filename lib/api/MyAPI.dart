import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:td_2/models/task.dart';
import 'package:td_2/models/todo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyAPI {
   static Future<List<Task>> getTasks() async {
    await Future.delayed(Duration(seconds: 1));
    final dataString = await _loadAsset('./assets/mydata/tasks.json');
    final Map<String, dynamic> json = jsonDecode(dataString);
    if (json['tasks'] != null) {
      final tasks = <Task>[];
      json['tasks'].forEach((element) {
        tasks.add(Task.fromJson(element));
      });
      return tasks;
    } else {
      return [];
    }
  }

  static Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }

  static Future<List<todo>> getTodos() async {
    await Future.delayed(Duration(seconds: 1));
    final dataString = await _loadAsset('./assets/mydata/todos.json');
    final List<dynamic> json = jsonDecode(dataString);
    return json.map((e) => todo.fromJson(e)).toList();
  }

   static Future<List<todo>> loadFromAPI() async {
     try {
       final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

       if (response.statusCode == 200) {
         final List<dynamic> json = jsonDecode(response.body);
         return json.map((e) => todo.fromJson(e)).toList();
       } else {
         throw Exception('Failed to load todos from API');
       }
     } catch (e) {
       print('Caught error: $e');
       throw e;
     }
   }
}