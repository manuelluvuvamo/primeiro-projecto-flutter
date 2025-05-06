import 'package:flutter/material.dart';
import 'package:primeiro_projecto_flutter/components/task.dart';
import 'package:primeiro_projecto_flutter/data/task_inherited.dart';

class TaskInheritedProvider extends StatefulWidget {
  final Widget child;

  const TaskInheritedProvider({super.key, required this.child});

  @override
  State<TaskInheritedProvider> createState() => _TaskInheritedProviderState();
}

class _TaskInheritedProviderState extends State<TaskInheritedProvider> {
  int globalLevel = 0;
  final List<Task> taskList = [
    // Task('Aprender Flutter', 'assets/images/1.png', 3),
    // Task('Andar de Bike', 'assets/images/2.webp', 2),
    // Task('Meditar', 'assets/images/3.jpeg', 5),
    // Task('Ler', 'assets/images/4.jpg', 4),
    // Task('Jogar', 'assets/images/5.avif', 1),
  ];

  void updateGlobalLevel() {
    setState(() {
      globalLevel = taskList.fold(0, (sum, task) => sum + task.nivel * task.dificuldade);
    });
  }

  void newTask(String name, String image, int difficulty) {
    setState(() {
      taskList.add(Task(name, image, difficulty));
    });
  }

  @override
  Widget build(BuildContext context) {
    return TaskInherited(
      globalLevel: globalLevel,
      taskList: taskList,
      updateGlobalLevel: updateGlobalLevel,
      newTask: newTask,
      child: widget.child,
    );
  }
}