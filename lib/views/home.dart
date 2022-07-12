import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/todo_provider.dart';

class HomeScreen extends StatelessWidget {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todos = Provider.of<TodoProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text("new ToDo"),
              content: Column(
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(hintText: "title"),
                  ),
                  TextField(
                    controller: _description,
                    decoration: InputDecoration(hintText: " Description"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final title = _titleController.text;
                      final desc = _description.text;
                      todos.addToDo(title, desc);
                      Navigator.pop(context);
                    },
                    child: Text("Add"),
                  ),
                ],
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: todos.todos.length,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(todos.todos[index].title),
              subtitle: Text(todos.todos[index].descrieption),
              trailing: IconButton(
                onPressed: () => todos.delete(index),
                icon: Icon(Icons.delete),
              ),
            );
          }),
    );
  }
}
