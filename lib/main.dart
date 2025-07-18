import 'package:flutter/material.dart';

class Player {
  String? name;
  String? id;
  Player({this.name, this.id});
}

void main() {
  var corpName = 'Nullara';
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    var userName = Player(name: 'User2');
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        body: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(height: 80, width: double.infinity),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Hey, Selena!',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
