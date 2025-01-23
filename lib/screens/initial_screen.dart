import 'package:flutter/material.dart';
import 'package:primeiro_projecto_flutter/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        shadowColor: Colors.black,
        leading: Container(),
        title: const Text(
          'Tarefas',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: Duration(milliseconds: 1000),
        child: ListView(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(Icons.remove_red_eye),
      ),
    );
  }
}
