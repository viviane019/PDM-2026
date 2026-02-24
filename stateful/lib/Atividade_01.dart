import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: PaginaContador()));
}

class PaginaContador extends StatefulWidget {
  @override
  _PaginaContadorState createState() => _PaginaContadorState();
}

class _PaginaContadorState extends State<PaginaContador> {
  int numero = 0; // guarda o valor sorteado

  void gerarNumero() {
    setState(() {
      // Random().nextInt(10) gera 0..9; somamos 1 para obter 1..10
      numero = Random().nextInt(10) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meu App Interativo')),
      body: Center(
        child: Text(
          'Número aleatório: $numero',
          style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: gerarNumero,
        child: Icon(Icons.refresh),
      ),
    );
  }
}