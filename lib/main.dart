import 'package:dice/home.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    const MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.teal,
          // appBar: AppBar(
          //   title: Text('Dicee'),
          //   backgroundColor: Colors.red,
          // ),
          body: DicePage(),
        ),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int? player, dice;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          const Text(
            "Welcome to",
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: "SourceSansPro",
              color: Colors.white,
              letterSpacing: 2.5,
            ),
          ),
          const Text(
            "Rolling Dices",
            style: TextStyle(
              fontSize: 40.0,
              fontFamily: "Pacifico",
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      player = int.tryParse(value);
                    });
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: 'Enter The Number Of Players',
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.7)),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.2),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0))),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a number';
                    } else if (!(int.parse(value) <= 4 &&
                        int.parse(value) >= 1)) {
                      return 'Please enter a number [1-4]';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      dice = int.tryParse(value);
                    });
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: 'Enter The Number Of Dices',
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.7)),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.2),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0))),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a number';
                    } else if (!(int.parse(value) <= 4 &&
                        int.parse(value) >= 1)) {
                      return 'Please enter a number [1-3]';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  style: const ButtonStyle(
                    backgroundColor: null,
                  ),
                  onPressed: () {
                    final isValid = _formKey.currentState!.validate();
                    if (isValid) {
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Submitted')));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DicePage1(
                                  player: player!,
                                  dice: dice!,
                                )),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Invalid Data'),
                      ));
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
