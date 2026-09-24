import 'package:flutter/material.dart';
import 'package:flutter_practice/local_storage/task_model.dart';

class DetailTaskScreen extends StatefulWidget {
  const DetailTaskScreen({super.key, required this._task});

  final TaskModel _task;

  @override
  State<DetailTaskScreen> createState() => _DetailTaskScreenState();
}

class _DetailTaskScreenState extends State<DetailTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task Details")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            spacing: 10,
            children: [
              Row(
                children: [
                  Text(widget._task.title.toString()),

                  if (widget._task.isDone) ...[Icon(Icons.done)],
                ],
              ),

              Text(widget._task.description.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
