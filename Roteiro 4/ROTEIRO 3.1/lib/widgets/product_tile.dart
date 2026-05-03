import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final String nome;

  const ProductTile({
    super.key,
    required this.nome,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // 1. leading: Ícone à esquerda
      leading: const Icon(
        Icons.shopping_cart, 
        color: Colors.blue,
      ),

      // Título principal
      title: Text(
        nome,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),

      // 2. subtitle: Texto logo abaixo do título
      subtitle: const Text("Produto disponível"),

      // 3. trailing: Ícone à direita (geralmente uma seta de indicação)
      trailing: const Icon(
        Icons.arrow_forward_ios, 
        size: 16, 
        color: Colors.grey,
      ),

      // Opcional: Adiciona um efeito visual ao clicar
      onTap: () {
        print("Selecionado: $nome");
      },
    );
  }
}