import 'package:flutter/material.dart';
import 'package:todolist/models/todo_model.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final ValueChanged<bool?> onChanged;
  final VoidCallback? onTap; // onTap 콜백 추가

  TodoItem({
    required this.todo,
    required this.onChanged,
    this.onTap, // 생성자에 onTap 추가
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // GestureDetector로 감싸서 탭 동작을 처리
      onTap: onTap,
      child: Card(
        child: ListTile(
          title: Text(
            todo.title,
            style: TextStyle(
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Checkbox(
            value: todo.isDone,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
