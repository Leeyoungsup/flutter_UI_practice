// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'widgets/button.dart';

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
    var userName = Player(name: 'User');
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40, width: double.infinity),
              Row(
                //Menu Bar
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Hey, ${userName.name}!',
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
              SizedBox(height: 40),
              Row(
                //Total Balance
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Balance',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '\$5 194 392',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Button(
                            text: 'Transfer',
                            bgColor: Color(0xFFF2B33A),
                            textColor: Colors.black,
                          ),
                          Button(
                            text: 'Request',
                            bgColor: Colors.white.withOpacity(0.1),
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(height: 100),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Wallets',
                            style: TextStyle(
                              fontSize: 36,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'view all',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ],
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
