import 'package:flutter/material.dart';
import 'package:primeiro_projecto_flutter/components/task.dart';

class TaskInherited extends InheritedWidget {

  final int globalLevel;
  final List<Task> taskList;
  final Function updateGlobalLevel;
  final Function(String, String, int) newTask;

  TaskInherited({
    super.key,
    required super.child,
    required this.globalLevel,
    required this.taskList,
    required this.updateGlobalLevel,
    required this.newTask,
  });

  static TaskInherited of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>()!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length || oldWidget.globalLevel != globalLevel;
  }
}
