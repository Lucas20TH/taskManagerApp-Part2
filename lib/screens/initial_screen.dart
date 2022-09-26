import 'package:flutter/material.dart';
import '../data/exercises_inherited.dart';
import 'form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Exercícios"),
            titleSpacing: 40,
            shadowColor: Colors.white,
            backgroundColor: Colors.blue,
            actions: [
              IconButton(
                padding: const EdgeInsets.only(right: 15),
                icon: const Icon(Icons.fitness_center),
                tooltip: 'Created By Lucas',
                onPressed: () {
                },
              ),
            ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white70,
          hoverColor: Colors.black,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (contextNew) => FormScreen(
                          exerciseContext: context,
                        )));
          },
          child: const Icon(
            Icons.add_rounded,
            size: 30,
            color: Colors.black,
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.only(top: 8, bottom: 70),
          children: ExercisesInherited.of(context).exercisesList,
        ));
  }
}
