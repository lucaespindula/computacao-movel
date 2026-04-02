import 'package:flutter/material.dart';
import 'task_screen.dart';
import 'ex3_screen.dart';
import 'ex4_screen.dart' hide Ex3Screen;
import 'ex5_screen.dart' hide Ex3Screen;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercícios Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TaskScreen(),
                  ),
                );
              },
              child: const Text('Exercício 1 e 2'),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Ex3Screen(),
                  ),
                );
              },
              child: const Text('Exercício 3'),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Ex4Screen(),
                  ),
                );
              },
              child: const Text('Exercício 4'),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Ex5Screen(),
                  ),
                );
              },
              child: const Text('Exercício 5'),
            ),
          ],
        ),
      ),
    );
  }
}