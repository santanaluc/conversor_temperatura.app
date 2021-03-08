import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//Classe statless não é uma classe alterável

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Material app está dividido em 3 partes: Título, Tema, Homepage
      title: "Conversor de Temperatura",
      theme: new ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.cyan,
          primaryColor: const Color(0xFF212121),
          accentColor: const Color(0xFF64ffda),
          canvasColor: const Color(0xFF303030),
          fontFamily: 'Roboto'),
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('°C - °F'),
        centerTitle: true,
      ),
    );
  }
}
