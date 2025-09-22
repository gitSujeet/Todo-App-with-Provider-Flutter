import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier{
  final List <Task> _tasks = [];
  List <Task> get tasks => _tasks;

  void addTask(String title){
    _tasks.add(Task(id: DateTime.now().toString(), title: title));
    notifyListeners();
  }


  void toggleTask(String id){
    final task = _tasks.firstWhere((task) => task.id == id);
    task.isDone = !task.isDone;
    notifyListeners();
  }
  void removeTask(String id){
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }
}

