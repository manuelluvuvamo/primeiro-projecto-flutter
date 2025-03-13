import 'package:flutter/material.dart';
import 'package:primeiro_projecto_flutter/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required super.child,
  });

  final List<Task> taskList = [
    Task('Aprender Flutter', 'assets/images/1.png', 3),
    Task('Andar de Bike', 'assets/images/2.webp', 2),
    Task('Meditar', 'assets/images/3.jpeg', 5),
    Task('Ler', 'assets/images/4.jpg', 4),
    Task('Jogar', 'assets/images/5.avif', 1),
  ];

  void newTask(String name, String image, int difficulty) {
    taskList.add(Task(name, image, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>()!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
