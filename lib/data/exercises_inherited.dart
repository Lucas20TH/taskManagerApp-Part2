import 'package:flutter/cupertino.dart';

import '../components/exercises.dart';

class ExercisesInherited extends InheritedWidget {
  ExercisesInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);
  final List<Exercises> exercisesList = [
    Exercises(
      "Esteira",
      'assets/images/Treadmill.png',
      1,
    ),
     Exercises(
      "Bicicleta",
      'assets/images/Bike.png',
      1,
    ),
     Exercises(
      "Costas",
      'assets/images/Back.png',
      3,
    ),
     Exercises(
      "Peito",
      'assets/images/Chest.png',
      4,
    ),
     Exercises(
      "Abdômen",
      'assets/images/Abs.png',
      4,
    ),
     Exercises(
      "Elíptico",
      'assets/images/Eliptical.png',
      3,
    ),
     Exercises(
      "Quadríceps",
      'assets/images/Quadriceps.png',
      4,
    ),
  ];

  void newExercise(String name, String photo, int difficulty){
    exercisesList.add(Exercises(name, photo, difficulty));
  }

  static ExercisesInherited of(BuildContext context) {
    final ExercisesInherited? result =
        context.dependOnInheritedWidgetOfExactType<ExercisesInherited>();
    assert(result != null, 'No ExercisesInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ExercisesInherited oldWidget) {
    return oldWidget.exercisesList.length != exercisesList;
  }
}
