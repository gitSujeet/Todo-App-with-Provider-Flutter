import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Checkbox(
          value: task.isDone,
          shape: const CircleBorder(),
          onChanged: (_) => taskProvider.toggleTask(task.id),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            decoration: task.isDone ? TextDecoration.lineThrough : null,
            color: task.isDone ? Colors.grey : Colors.black,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
          onPressed: () => taskProvider.removeTask(task.id),
        ),
      ),
    );
  }
}
