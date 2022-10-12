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
  List<int> rand = [];

  int left = 2, right = 5;
  @override
  Widget build(BuildContext context) {
    for (var i = 0; i <= widget.dice; i++) {
      rand.add(1);
    }
    return SafeArea(
      child: Scaffold(
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
              const Text(
                "IT'S PLAYER 1 TURN",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.red, //<-- SEE HERE
                      ),
                      onPressed: () {
                        change();
                      },
                      child: const Text(
                        'Player 1',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    if (widget.player == 4)
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.blue[900], //<-- SEE HERE
                        ),
                        onPressed: () {
                          change();
                        },
                        child: const Text(
                          'Player 2',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    if (widget.player != 4)
                      AbsorbPointer(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue[900], //<-- SEE HERE
                          ),
                          onPressed: () {
                            change();
                          },
                          child: const Text(
                            'Player 2',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      )
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Wrap(
                    children: [
                      for (var i = 0; i < widget.dice; i++)
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image(
                            height: 150,
                            width: 150,
                            // height: MediaQuery.of(context).size.width / i,
                            // width: MediaQuery.of(context).size.width / i,
                            image: AssetImage(
                              "images/dice${rand[i]}.png",
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (widget.player == 4)
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.green, //<-- SEE HERE
                        ),
                        onPressed: () {
                          change();
                        },
                        child: const Text(
                          'Player 3',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    if (widget.player != 4)
                      AbsorbPointer(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.green, //<-- SEE HERE
                          ),
                          onPressed: () {
                            change();
                          },
                          child: const Text(
                            'Player 3',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.yellow, //<-- SEE HERE
                      ),
                      onPressed: () {
                        change();
                      },
                      child: const Text(
                        'Player 4',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  void change() {
    setState(() {
      for (var i = 0; i < widget.dice; i++) {
        rand[i] = Random().nextInt(6) + 1;
      }
    });
  }
}
