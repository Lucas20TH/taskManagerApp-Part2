import 'package:flutter/material.dart';
import 'difficulty.dart';

class Exercises extends StatefulWidget {
  final String taskName;
  final String photo;
  final int level;
  bool theme = true;

  Exercises(this.taskName, this.photo, this.level, {Key? key})
      : super(
          key: key,
        );

  int nivel = 0;
  bool changeColor = false;
  int colorBar = 0;

  changeColorBar() {
    switch (colorBar) {
      case 1:
        return Colors.red;

      case 2:
        return Colors.pinkAccent;

      case 3:
        return Colors.brown;

      case 4:
        return Colors.orangeAccent;

      case 5:
        return Colors.purpleAccent;

      default:
        return Colors.blue;
    }
  }

  changeLineBar() {
    switch (colorBar) {
      case 1:
        return Colors.red.shade900;

      case 2:
        return Colors.pinkAccent.shade700;

      case 3:
        return Colors.brown.shade900;

      case 4:
        return Colors.orangeAccent.shade700;

      case 5:
        return Colors.purpleAccent.shade700;

      default:
        return Colors.blue;
    }
  }

  @override
  State<Exercises> createState() => _ExercisesState();
}

class _ExercisesState extends State<Exercises> {

  bool theme = true;
  bool assetOrNetwork() {
    if (widget.photo.contains('http')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white24,
      child: Padding(

        padding: const EdgeInsets.only(top: 12.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: widget.changeColor == false
                      ? Colors.blue
                      : widget.changeColorBar()),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: theme == true
                          ? Colors.white70 : Colors.grey),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black12,
                        ),
                        width: 72,
                        height: 100,
                        child: assetOrNetwork()
                            ? Image.asset(
                                widget.photo,
                                fit: BoxFit.contain,
                              )
                            : Image.network(
                                widget.photo,
                                fit: BoxFit.contain,
                              ), // Image.network
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 200,
                              child: Text(
                                widget.taskName,
                                style: const TextStyle(fontSize: 26),
                                overflow: TextOverflow.ellipsis,
                              )),
                          Difficulty(
                            difficultyLevel: widget.level,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                widget.nivel++;
                                if ((widget.nivel / widget.level) / 10 > 1) {
                                  widget.changeColor = true;
                                  widget.colorBar++;
                                  widget.nivel = 0;
                                } else if ((widget.nivel / widget.level) / 10 <
                                    1) {
                                  widget.changeColor == false;
                                } else {
                                  widget.changeColor == false;
                                }
                              });
                              //print('$nivel');
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Icon(Icons.arrow_drop_up),
                                Text(
                                  "UP",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            )),
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
                        width: 250,
                        child: LinearProgressIndicator(
                          color: widget.changeColor == false
                              ? Colors.lightBlue
                              : widget.changeLineBar(),
                          value: (widget.level > 0)
                              ? (widget.nivel / widget.level) / 10
                              : 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        "Nível: ${widget.nivel}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
