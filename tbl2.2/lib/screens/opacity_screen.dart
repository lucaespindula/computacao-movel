import 'package:flutter/material.dart';

class OpacityScreen extends StatefulWidget {
  const OpacityScreen({super.key});

  @override
  State<OpacityScreen> createState() => _OpacityScreenState();
}

class _OpacityScreenState extends State<OpacityScreen> {
  double opacidade = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercício 3")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: opacidade,
              child: Container(
                width: 150,
                height: 150,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  opacidade = opacidade == 1.0 ? 0.0 : 1.0;
                });
              },
              child: const Text("Mostrar / Ocultar"),
            ),
          ],
        ),
      ),
    );
  }
}