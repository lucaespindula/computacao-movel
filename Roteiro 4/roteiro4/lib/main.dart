import 'package:flutter/material.dart';
import 'mensagem_lifecycle_screen.dart';
import 'screens/pokemon_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // BOTÃO 1 → TELA DE CICLO DE VIDA
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MensagemLifecycleScreen(),
                  ),
                );
              },
              child: const Text("Abrir Mensagem Lifecycle"),
            ),

            const SizedBox(height: 20),

            // BOTÃO 2 → POKÉDEX
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PokemonScreen(),
                  ),
                );
              },
              child: const Text("Abrir Pokédex"),
            ),
          ],
        ),
      ),
    );
  }
}
