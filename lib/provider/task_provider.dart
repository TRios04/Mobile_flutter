import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/model/task_model.dart';

class TaskProvider with ChangeNotifier {
  List<TaskModel> _tasks = [];
  List<TaskModel> get tasks => _tasks;

  addTask(TaskModel task) {
    _tasks.add(task);
    notifyListeners();
  }

  deleteTask(int id) {
    for (int i = 0; i < _tasks.length; i++) {
      if (_tasks[i].id == id) {
        _tasks.removeAt(i);
        notifyListeners();
        return;
      }
    }
  }
}
