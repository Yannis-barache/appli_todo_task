import 'package:flutter/material.dart';
import 'package:td_2/api/MyAPI.dart';
import 'package:td_2/models/task.dart';

class Card1 extends StatelessWidget {
  const Card1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Task> tasks = Task.generateTask(10); // Génère 10 tâches

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 6,
          margin: EdgeInsets.all(10),
          color: Colors.black,
          child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('T'),
              ),
              title: Text(
                tasks[index].title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                tasks[index].nbhours.toString() + ' heures',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              onTap: () {
                print(tasks[index].title + ' was tapped');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskDetails(task: tasks[index]),
                  ),
                );
              }
          ),
        );
      },
    );
  }
}

class TaskDetails extends StatelessWidget{

  TaskDetails({required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(task.description),
            SizedBox(height: 20),
            Text(
              'Difficulté',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(task.difficulty.toString()),
            SizedBox(height: 20),
            Text(
              'Nombre d\'heures estimées',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(task.nbhours.toString()),
            SizedBox(height: 20),
            Text(
              'Tags',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Wrap(
              spacing: 8,
              children: task.tags.map((tag) {
                return Chip(
                  label: Text(tag),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

}