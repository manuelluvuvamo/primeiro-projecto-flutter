import 'package:flutter/material.dart';
import 'package:primeiro_projecto_flutter/components/task.dart';
import 'package:primeiro_projecto_flutter/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        shadowColor: Colors.black,
        //leading: Container(),
        title: const Text(
          'Tarefas',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Task('Aprender Flutter', 'assets/images/1.png', 3),
          Task('Andar de Bike', 'assets/images/2.webp', 2),
          Task('Meditar', 'assets/images/3.jpeg', 5),
          Task('Ler', 'assets/images/4.jpg', 4),
          Task('Jogar', 'assets/images/5.avif', 1),
          SizedBox(
            height: 80,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormScreen();
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
