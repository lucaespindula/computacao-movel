import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  bool expandido = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("exercicio 4")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              expandido = !expandido;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 300,
            height: expandido ? 200 : 80,
            decoration: BoxDecoration(
              color: expandido ? Colors.blue : Colors.orange,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                expandido ? "abriu" : "clique pra abrir",
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}