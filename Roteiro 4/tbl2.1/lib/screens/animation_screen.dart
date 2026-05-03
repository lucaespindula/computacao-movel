import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  double largura = 100;
  double altura = 100;
  Color cor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercício 1")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: largura,
              height: altura,
              color: cor,
              curve: Curves.easeInOut,
              child: const Center(
                child: Text("C. Móvel", style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  largura = largura == 100 ? 250 : 100;
                  altura = altura == 100 ? 250 : 100;
                  cor = cor == Colors.blue ? Colors.red : Colors.blue;
                });
              },
              child: const Text("Animar Cor e Altura"),
            ),
          ],
        ),
      ),
    );
  }
}