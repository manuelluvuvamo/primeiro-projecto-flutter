import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            shadowColor: Colors.black,
              iconTheme: IconThemeData(
                color: Colors.white, //change your color here
              ),
            title: const Text(
              'Nova Tarefa',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Center(
              child: SingleChildScrollView(
            child: Container(
              height: 650,
              width: 375,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12,
                  border: Border.all(width: 3)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        validator: (value) {
                              if (value!.isEmpty) {
                                return 'Por favor insira um nome da tarefa';
                              } else {
                                return null;
                              }
                            },	
                        controller: nameController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Nome',
                            fillColor: Colors.white70,
                            filled: true)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        validator: (value) {
                              if (value!.isEmpty ||int.parse(value) > 5 || int.parse(value) < 1) {
                                return 'Por favor insira a dificuldade entre 1 e 5';
                              } else {
                                return null;
                              }
                            },
                        keyboardType: TextInputType.number,
                        controller: difficultyController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Dificuldade',
                            fillColor: Colors.white70,
                            filled: true)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        onChanged: (text) {
                          setState(() {});
                        },
                        validator: (value) {
                              if (value!.isEmpty) {
                                return 'Por favor insira um URL da Imagem!';
                              } else {
                                return null;
                              }
                            },
                        keyboardType: TextInputType.url,
                        controller: imageController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Imagem',
                            fillColor: Colors.white70,
                            filled: true)),
                  ),
                  Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2, color: Colors.blue)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(imageController.text, errorBuilder:
                              (BuildContext context, Object exception,
                                  StackTrace? stackTrace) {
                            return Image.asset(
                              'assets/images/nophoto.webp',
                              fit: BoxFit.cover,
                            );
                          }, fit: BoxFit.cover))),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print(nameController.text);
                          print(int.parse(difficultyController.text));
                          print(imageController.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Tarefa Adicionada')));
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Adicionar'))
                ],
              ),
            ),
          ))),
    );
  }
}
