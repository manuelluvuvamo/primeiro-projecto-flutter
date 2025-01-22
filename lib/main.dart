import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            shadowColor: Colors.black,
            leading: Container(),
            title: const Text(
              'Tarefas',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: ListView(
            children: [
              Task('Aprender Flutter',
                  'https://images.pexels.com/photos/161172/cycling-bike-trail-sport-161172.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
              Task('Andar de Bike',
                  'https://images.pexels.com/photos/161172/cycling-bike-trail-sport-161172.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
              Task('Meditar',
                  'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg'),
              Task('Ler',
                  'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg'),
              Task('Jogar',
                  'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg'),
            ],
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {}),
        ));
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  const Task(this.nome, this.foto, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Stack(
            children: [
              Container(
                color: Colors.blue,
                height: 140,
              ),
              Column(
                children: [
                  Container(
                    color: Colors.white,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.black26,
                          width: 72,
                          height: 100,
                          child: Image.network(
                            widget.foto,
                          ),
                        ),
                        SizedBox(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: TextStyle(
                                  fontSize: 24,
                                  overflow: TextOverflow.ellipsis),
                            )),
                        SizedBox(
                          height: 65,
                          width: 65,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                nivel++;
                              });
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.blue),
                                shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5)))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(Icons.arrow_drop_up, color: Colors.white),
                                Text(
                                  'UP',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              width: 200,
                              child: LinearProgressIndicator(
                                color: Colors.white,
                                value: nivel / 10,
                              ))),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Nivel: $nivel',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ))
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
