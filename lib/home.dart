import 'dart:math';

import 'package:flutter/material.dart';

class DicePage1 extends StatefulWidget {
  const DicePage1({super.key, required this.player, required this.dice});
  final int player;
  final int dice;
  @override
  State<DicePage1> createState() => _DicePage1State();
}

class _DicePage1State extends State<DicePage1> {
  int left = 2, right = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
        child: Column(
          children: [
            Column(
              children: const [
                Text(
                  "Welcome to",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "SourceSansPro",
                    color: Colors.white,
                    letterSpacing: 2.5,
                  ),
                ),
                Text(
                  "Rolling Dices",
                  style: TextStyle(
                    fontSize: 40.0,
                    fontFamily: "Pacifico",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton(
              style: const ButtonStyle(
                backgroundColor: null,
              ),
              onPressed: () {
                change();
              },
              child: const Text(
                'Player 1',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Expanded(
              child: Center(
                child: Wrap(
                  children: [
                    for (var i = 1; i <= widget.dice; i++)
                      TextButton(
                        onPressed: (() {
                          //change();
                          // setState(() {
                          //   left = Random().nextInt(6) + 1;
                          // });
                        }),
                        child: Image(
                          height: 100,
                          width: 100,
                          image: AssetImage(
                            "images/dice$left.png",
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            // Expanded(
            //   child: GridView.builder(
            //     itemCount: widget.dice,
            //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            //       maxCrossAxisExtent: 400,
            //     ),
            //     itemBuilder: (BuildContext ctx, index) {
            //       return Expanded(
            //         child: TextButton(
            //           onPressed: (() {
            //             //change();
            //             // setState(() {
            //             //   left = Random().nextInt(6) + 1;
            //             // });
            //           }),
            //           child: Image(
            //             image: AssetImage("images/dice$left.png"),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            OutlinedButton(
              style: const ButtonStyle(
                backgroundColor: null,
              ),
              onPressed: () {
                change();
              },
              child: const Text(
                'Player 2',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  void change() {
    setState(() {
      left = Random().nextInt(6) + 1;
      right = Random().nextInt(6) + 1;
    });
  }
}
