import 'package:flutter/material.dart';
import 'package:flutter_practice/local_storage/share_preference/detail_task_screen.dart';
import 'package:flutter_practice/local_storage/share_preference/task_probider.dart';
import 'package:flutter_practice/local_storage/task_model.dart';
import 'package:provider/provider.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    TaskProvider taskProvider = context.read<TaskProvider>();
    int index = taskProvider.getOriginalIndex(task);
    return Card(
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailTaskScreen(task: task)),
        ),
        child: ListTile(
          title: Text("${index + 1}. ${task.title}"),
          subtitle: Text(task.description ?? ''),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                value: task.isDone,
                onChanged: (value) {
                  context.read<TaskProvider>().toggleTaskStatus(index);
                },
              ),
              IconButton(
                onPressed: () {
                  context.read<TaskProvider>().deleteTask(index);
                },
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
