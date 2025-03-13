import 'package:flutter/material.dart';
import 'package:primeiro_projecto_flutter/components/task.dart';
import 'package:primeiro_projecto_flutter/data/task_inherited.dart';
import 'package:primeiro_projecto_flutter/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {

    final globalLevel = TaskInherited.of(context).globalLevel;
    final maxLevel = TaskInherited.of(context).taskList.length * 10; // Supondo que o nível máximo de cada tarefa seja 10


    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          shadowColor: Colors.black,
          //leading: Container(),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tarefas',
                style: TextStyle(color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: SizedBox(
                          width: 250,
                          child: LinearProgressIndicator(
                            color: Colors.white,
                            value: (globalLevel > 0) ? (globalLevel / maxLevel) : 0,

                          ))),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Nivel: ${TaskInherited.of(context).globalLevel}',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ))
                ],
              )
            ],
          )),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        children: TaskInherited.of(context).taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (contextNew) {
            return FormScreen(taskContext: context);
          }));
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
