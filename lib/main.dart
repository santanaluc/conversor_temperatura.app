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
        title: new Text('°C - °F / °F - °C'),
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
  TextEditingController _ctrlCelsius = TextEditingController();
  String msg = "Conversor";
  String msgResultF = "Fahrenheit";
  String msgResultC = "Celsius";

  void calcularF() {
    double _celsius = double.tryParse(_ctrlCelsius.text);
    if (_celsius == null) {
      setState(() {
        msg = "Digite em graus Celsius";
      });
    } else {
      var fahrenheit = (9 / 5) * _celsius + 32;
      setState(() {
        msg = "Resultado: $fahrenheit °F";
        SystemChannels.textInput.invokeListMethod('TextInput.hide');
      });
    }
  }

  void novo() {
    setState(() {
      _ctrlCelsius.text = " ";
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
            controller: _ctrlCelsius,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Graus Celsius:"),
            style: TextStyle(
                fontSize: 20.0,
                color: const Color(0xFF64ffda),
                fontWeight: FontWeight.w400,
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
                },
                color: const Color(0xFF212121),
                child: new Text(
                  "Calcular",
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
              )
            ],
          )
        ],
      ),
    );
  }
}
