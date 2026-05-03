import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String tarefa;
  final VoidCallback onRemove; // Função que será chamada ao clicar no excluir

  const TaskTile({
    super.key,
    required this.tarefa,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.check_circle_outline, color: Colors.green),
      title: Text(tarefa),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: onRemove,
      ),
    );
  }
}