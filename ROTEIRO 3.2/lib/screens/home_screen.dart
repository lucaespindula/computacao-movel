import 'package:flutter/material.dart';
import 'task_list_screen.dart'; // Importa a tela de tarefas

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gerenciador de Tarefas"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Usando o widget de título que você criou no Exercício 3
            const Text("Minhas Tarefas", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            
            const SizedBox(height: 10),
            const Text(
              "Organize o seu dia de forma simples.",
              style: TextStyle(color: Colors.grey),
            ),
            
            const SizedBox(height: 40),
            
            // Botão para navegar para a lista
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.list_alt),
              label: const Text("Abrir Lista de Tarefas"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TaskListScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}