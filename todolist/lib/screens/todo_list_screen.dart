import 'package:flutter/material.dart';
import 'package:todolist/models/todo_model.dart';
import 'package:todolist/widgets/todo_item.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return Dismissible(
            key: Key(todo.title),
            onDismissed: (direction) {
              setState(() {
                todos.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Todo deleted'),
                ),
              );
            },
            child: TodoItem(
              todo: todo,
              onChanged: (value) {
                setState(() {
                  todo.isDone = value!;
                });
              },
              onTap: () {
                _editTodo(todo);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addTodo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTodoTitle = '';
        return AlertDialog(
          title: const Text('Add New Todo'),
          content: TextField(
            onChanged: (value) {
              newTodoTitle = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  todos.add(Todo(title: newTodoTitle));
                });
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _editTodo(Todo todo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String updatedTitle = todo.title;
        return AlertDialog(
          title: const Text('Edit Todo'),
          content: TextField(
            onChanged: (value) {
              updatedTitle = value;
            },
            controller: TextEditingController(text: todo.title),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  todo.title = updatedTitle;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
