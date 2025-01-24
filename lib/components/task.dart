import 'package:flutter/material.dart';
import 'package:primeiro_projecto_flutter/components/difficulty.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;
  const Task(this.nome, this.foto, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: widget.dificuldade > 0
                    ? ((nivel / widget.dificuldade) / 10 >= 1)
                        ? Colors.green
                        : ((nivel / widget.dificuldade) / 10 > 0.75)
                            ? Colors.lightGreen
                            : ((nivel / widget.dificuldade) / 10 > 0.5)
                                ? Colors.greenAccent
                                : ((nivel / widget.dificuldade) / 10 > 0.25)
                                    ? Colors.teal
                                    : Colors.blue
                    : Colors.green,
              ),
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 72,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.black26,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              widget.foto,
                              fit: BoxFit.cover,
                            ),
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 200,
                              child: Text(
                                widget.nome,
                                style: TextStyle(
                                    fontSize: 24,
                                    overflow: TextOverflow.ellipsis),
                              )),
                          Difficulty(difficultyLevel: widget.dificuldade)
                        ],
                      ),
                      SizedBox(
                        height: 65,
                        width: 65,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (widget.dificuldade > 0 &&
                                  (nivel / widget.dificuldade) / 10 < 1) {
                                nivel++;
                              }
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.blue),
                              shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)))),
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
                              value: (widget.dificuldade > 0)
                                  ? (nivel / widget.dificuldade) / 10
                                  : 1,
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
        ));
  }
}
