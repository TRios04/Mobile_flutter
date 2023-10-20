import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1.0)
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Row (children: [
              Icon (Icons.home_outlined),
              Icon (Icons.favorite_border_sharp),
              Icon (Icons.settings_accessibility)
            ],)
          ],
        )
      )
    ); 
        
  }
}

