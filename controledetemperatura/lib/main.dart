import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TemperaturaApp(),
  ));
}

class TemperaturaApp extends StatefulWidget {
  @override
  _TemperaturaAppState createState() => _TemperaturaAppState();
}

class _TemperaturaAppState extends State<TemperaturaApp> {
  int temperatura = 20;

  Color corFundo;
  IconData icone;
  String status;

  void atualizarStatus() {
    if (temperatura < 15) {
      corFundo = Colors.blue;
      icone = Icons.ac_unit;
      status = "Frio";
    } else if (temperatura < 30) {
      corFundo = Colors.green;
      icone = Icons.wb_sunny;
      status = "Agradável";
    } else {
      corFundo = Colors.red;
      icone = Icons.local_fire_department;
      status = "Quente";
    }
  }

  void aumentar() {
    setState(() {
      temperatura++;
      atualizarStatus();
    });
  }

  void diminuir() {
    setState(() {
      temperatura--;
      atualizarStatus();
    });
  }

  @override
  void initState() {
    super.initState();
    atualizarStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corFundo,
      appBar: AppBar(
        title: Text("Controle de Temperatura"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$temperatura °C",
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 20),
            Icon(
              icone,
              size: 100,
            ),
            Text(
              status,
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: diminuir,
                  child: Text("-"),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: aumentar,
                  child: Text("+"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}