import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        title: new Text('Conversor de Temperatura'),
        centerTitle: true,
      ),
      body: Conversor(),
    );
  }
}

class Conversor extends StatefulWidget {
  @override
  _ConversorState createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  TextEditingController _controller = TextEditingController();
  String msg = "Conversor";
  String msgResultF = "Fahrenheit";
  String msgResultC = "Celsius";

  void choice() {}

  void calcularF() {
    double _celsius = double.tryParse(_controller.text);
    if (_celsius == null) {
      setState(() {
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text("Digite um valor para conversão")));
      });
    } else {
      var fahrenheit = (9 / 5) * _celsius + 32;
      setState(() {
        msg = "Resultado: $fahrenheit °F";
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text("Conversão para Fahrenheit ralizada")));
        SystemChannels.textInput.invokeListMethod('TextInput.hide');
      });
    }
  }

  void calcularC() {
    double _fahrenheit = double.tryParse(_controller.text);
    if (_fahrenheit == null) {
      setState(() {
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text("Digite um valor para conversão")));
      });
    } else {
      var celsius = ((_fahrenheit - 32) * 5) / 9;
      setState(() {
        msg = "Resultado: $celsius °C";
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text("Conversão para Celsius ralizada")));
        SystemChannels.textInput.invokeListMethod('TextInput.hide');
      });
    }
  }

  void novo() {
    setState(() {
      _controller.text = " ";
      msg = "Conversor";
      SystemChannels.textInput.invokeListMethod('TextInput.hide');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            msg,
            style: new TextStyle(
                fontSize: 30.0,
                color: const Color(0xFF64ffda),
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto"),
            textAlign: TextAlign.center,
          ),
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Digite o grau e escolha a conversão"),
            style: TextStyle(
                fontSize: 15.0,
                color: const Color(0xFF64ffda),
                fontWeight: FontWeight.w300,
                fontFamily: "Roboto"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RaisedButton(
                onPressed: () {
                  calcularF();
                  // Scaffold.of(context).showSnackBar(SnackBar(
                  //     content: Text("Conversão para Fahrenheit ralizada")));
                },
                color: const Color(0xFF212121),
                child: new Text(
                  "°C - °F",
                  style: new TextStyle(
                      fontSize: 20.0,
                      color: const Color(0xFF64ffda),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto"),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  novo();
                },
                color: const Color(0xFF212121),
                child: new Text(
                  "Limpar",
                  style: new TextStyle(
                      fontSize: 20.0,
                      color: const Color(0xFF64ffda),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto"),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  calcularC();
                },
                color: const Color(0xFF212121),
                child: new Text(
                  "°F - °C",
                  style: new TextStyle(
                      fontSize: 20.0,
                      color: const Color(0xFF64ffda),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto"),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  SnackBar buildSnackBar() => SnackBar(content: Text('Have a snack!'));
}
