import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int difficultyLevel;

  const Difficulty({
    required this.difficultyLevel,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 13,
          color: (difficultyLevel >= 1) ? Colors.black : Colors.grey.shade500,
        ),
        Icon(Icons.star,
            size: 13,
            color:
                (difficultyLevel >= 2) ? Colors.black : Colors.grey.shade500),
        Icon(Icons.star,
            size: 13,
            color:
                (difficultyLevel >= 3) ? Colors.black : Colors.grey.shade500),
        Icon(Icons.star,
            size: 13,
            color:
                (difficultyLevel >= 4) ? Colors.black : Colors.grey.shade500),
        Icon(Icons.star,
            size: 13,
            color:
                (difficultyLevel >= 5) ? Colors.black : Colors.grey.shade500),
      ],
    );
  }
}
