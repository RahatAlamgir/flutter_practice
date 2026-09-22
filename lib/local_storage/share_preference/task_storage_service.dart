import 'dart:convert';
import 'package:flutter_practice/local_storage/task_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskStorageService {
  static const String _tasksKey = 'tasks_list';

  static Future<void> saveTasks(List<TaskModel> tasks) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> taskJsonList = tasks.map((task) {
      return jsonEncode(task.toJson());
    }).toList();

    await prefs.setStringList(_tasksKey, taskJsonList);
  }

  static Future<List<TaskModel>> getTasks() async {
    final prefs = await SharedPreferences.getInstance();

    List<String>? taskJsonList = prefs.getStringList(_tasksKey);

    if (taskJsonList == null) {
      return [];
    }

    return taskJsonList.map((taskString) {
      Map<String, dynamic> jsonMap = jsonDecode(taskString);
      return TaskModel.fromJson(jsonMap);
    }).toList();
  }

  static Future<void> clearTasks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tasksKey);
    //await prefs.clear();
  }
}
