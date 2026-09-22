import 'package:flutter/material.dart';
import 'package:flutter_practice/local_storage/share_preference/task_storage_service.dart';
import 'package:flutter_practice/local_storage/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> _tasks = [];

  List<TaskModel> get tasks => _tasks;

  Future<void> loadTasks() async {
    _tasks = await TaskStorageService.getTasks();
    notifyListeners();
  }

  Future<void> addTask(TaskModel task) async {
    _tasks.add(task);
    await TaskStorageService.saveTasks(_tasks);
    notifyListeners();
  }

  Future<void> deleteTask(int index) async {
    _tasks.removeAt(index);
    await TaskStorageService.saveTasks(_tasks);
    notifyListeners();
  }

  Future<void> toggleTaskStatus(int index) async {
    _tasks[index] = _tasks[index].copyWith(isDone: !_tasks[index].isDone);
    await TaskStorageService.saveTasks(_tasks);
    notifyListeners();
  }
}
