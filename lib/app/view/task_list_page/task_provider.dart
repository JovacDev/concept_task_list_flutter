import 'package:flutter/material.dart';
import 'package:task_list/app/repository/task_repository.dart';

import '../../model/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _taskList = [];

  final TaskRepository _taskRepository = TaskRepository();

  Future<void> fetchTasks() async {
    _taskList = await _taskRepository.getTasks();
    notifyListeners();
  }

  List<Task> get taskList => _taskList;

  set taskList(List<Task> value) {
    _taskList = value;
  }

  void onTaskDoneChange(Task task) {
    task.done = !task.done;
    _taskRepository.saveTasks(_taskList);
    notifyListeners();
  }

  void addNewTask(Task task) {
    _taskRepository.addTask(task);
    fetchTasks();
  }
}
