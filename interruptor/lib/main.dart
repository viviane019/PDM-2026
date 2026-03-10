import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Interruptor(),
  ));
}

class Interruptor extends StatefulWidget {
  const Interruptor({super.key});

  @override
  _InterruptorAppState createState() => _InterruptorAppState();
}

class _InterruptorAppState extends State<Interruptor> {
  bool estaAceso = false;

  void alternaLuz() {
    setState(() {
      estaAceso = !estaAceso;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: estaAceso ? const Color.fromARGB(255, 255, 0, 166) : Colors.grey[900],
      appBar: AppBar(
        title: const Text('Interruptor'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              estaAceso ? Icons.lightbulb : Icons.lightbulb_outline,
              size: 100,
              color: estaAceso ? const Color.fromARGB(255, 255, 255, 255) : Colors.black,
            ),
            const SizedBox(height: 20), // Adicionado apenas para dar um espacinho
            ElevatedButton(
              onPressed: alternaLuz, // Corrigido para o nome da sua função
              style: ElevatedButton.styleFrom(
                backgroundColor: estaAceso ? Colors.black : const Color.fromARGB(255, 255, 0, 166),
              ),
              child: Text(
                "Interruptor",
                style: TextStyle(
                  color: estaAceso ? Color.fromARGB(255, 255, 0, 166) : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}