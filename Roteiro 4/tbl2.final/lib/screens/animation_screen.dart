import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  bool ativo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("atividade final bala demais")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: ativo ? 250 : 120,
              height: ativo ? 200 : 120,
              decoration: BoxDecoration(
                color: ativo ? Colors.deepPurple : Colors.teal,
                borderRadius: BorderRadius.circular(ativo ? 50 : 10),
              ),
              child: const Icon(Icons.favorite, color: Colors.white, size: 50),
            ),
            const SizedBox(height: 30),
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: ativo ? 1.0 : 0.0,
              child: const Text(
                "oiiiii sdds!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              onPressed: () {
                setState(() {
                  ativo = !ativo;
                });
              },
              child: const Text("aperta"),
            ),
          ],
        ),
      ),
    );
  }
}