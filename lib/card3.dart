import 'package:flutter/material.dart';
import 'package:td_2/api/MyAPI.dart';
import 'package:td_2/models/todo.dart';

class Card3 extends StatelessWidget {

  const Card3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<todo>>(
        future: MyAPI.loadFromAPI(),
        builder:
            (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Show a loading spinner while waiting
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}'); // Show error message if something went wrong
          } else {
            List<todo> todos = snapshot.data ?? [];
            return ListView.builder(
              itemCount: todos.length,
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
                        todos[index].title??"inconnu",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        todos[index].completed.toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      onTap: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TodosDetails(todo: todos[index]),
                          ),
                        );
                      }
                  ),
                );
              },
            );
          }
        }
    );
  }
}

class TodosDetails extends StatelessWidget{

  TodosDetails({required this.todo});

  final todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title??"inconnu"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Titre',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(todo.title??"inconnu"),
            SizedBox(height: 20,),
            Text(
              'Complété?',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(todo.completed.toString()),

            SizedBox(height: 20,),
            Text(
              'Id de la tâche',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(todo.id.toString()),
            SizedBox(height: 20,),
            Text(
              'Id de l\'utilisateur',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(todo.userId.toString()),


          ],
        ),
      ),
    );
  }
}