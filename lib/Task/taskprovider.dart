//import 'package:falah/models/task.dart';
import 'package:flutter/material.dart';

import 'task.dart';

class TaskProvider extends ChangeNotifier{
  List<Task> _tasks = [
    Task(
      title: 'My first task',
      completed: false,
    ),
  ];
  List<Task> get tasks{
    return _tasks;
  }
  void addTask(task){
      _tasks.add(task);
      notifyListeners();//tgayer 3dd lmahamat ya3ni tkhalina ndiro tagyir lahdi 3la chacha
  }
  void removeTask(index){
    _tasks.removeAt(index);
    notifyListeners();
  }
  void makeTaskCompleted(index){
    _tasks[index].completed = !_tasks[index].completed;//3la hsab completed za3ma ida kanet true yrej3a false wla l3aks
    notifyListeners();
  }
}