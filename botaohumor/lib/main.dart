import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AtividadeHumor(),
  ));
}

class AtividadeHumor extends StatefulWidget {
  const AtividadeHumor({super.key});

  @override
  State<AtividadeHumor> createState() => _AtividadeHumorState();
}

class _AtividadeHumorState extends State<AtividadeHumor> {
  // 1. Definição dos Estados Iniciais
  String _emoji = "😐";
  String _textoHumor = "Neutro";
  Color _corTema = Colors.grey;

  // 2. Função de lógica para alterar o estado
  void _atualizarHumor(String novoEmoji, String novoTexto, Color novaCor) {
    setState(() {
      _emoji = novoEmoji;
      _textoHumor = novoTexto;
      _corTema = novaCor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Atividade: Botão de Humor"),
        backgroundColor: _corTema,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        color: _corTema.withOpacity(0.1), // Fundo suave com a cor do tema
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Exibição do Humor Atual
            Text(_emoji, style: const TextStyle(fontSize: 120)),
            const SizedBox(height: 20),
            Text(
              "Humor: $_textoHumor",
              style: TextStyle(
                fontSize: 32, 
                fontWeight: FontWeight.bold, 
                color: _corTema.darken(), // Cor do texto baseada no tema
              ),
            ),
            const SizedBox(height: 60),
            
            // Fileira de Botões de Seleção
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _botaoSeletor("😀", "Feliz", Colors.amber),
                _botaoSeletor("😐", "Neutro", Colors.blueGrey),
                _botaoSeletor("😡", "Bravo", Colors.redAccent),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 3. Widget de Botão Customizado para evitar repetição de código
  Widget _botaoSeletor(String emoji, String rotulo, Color cor) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => _atualizarHumor(emoji, rotulo, cor),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(20),
            shape: const CircleBorder(),
            elevation: 5,
          ),
          child: Text(emoji, style: const TextStyle(fontSize: 40)),
        ),
        const SizedBox(height: 8),
        Text(rotulo, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }
}

// Extensão simples para escurecer a cor do texto dinamicamente
extension ColorBrightness on Color {
  Color darken([double amount = .3]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
}