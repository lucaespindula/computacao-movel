import 'package:flutter/material.dart';
import '../widgets/task_tile.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  // 1. Lista de tarefas (Estado)
  final List<String> _tarefas = [];
  
  // 2. Controlador para o campo de texto
  final TextEditingController _controller = TextEditingController();

  void _adicionarTarefa() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _tarefas.add(_controller.text); // Adiciona à lista
        _controller.clear(); // Limpa o campo de texto
      });
    }
  }

  void _removerTarefa(int index) {
    setState(() {
      _tarefas.removeAt(index); // Remove da lista pela posição
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Tarefas")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: "Nova tarefa...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _adicionarTarefa,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tarefas.length,
              itemBuilder: (context, index) {
                return TaskTile(
                  tarefa: _tarefas[index],
                  onRemove: () => _removerTarefa(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}