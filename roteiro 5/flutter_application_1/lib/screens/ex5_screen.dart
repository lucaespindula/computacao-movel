import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ex5Screen extends StatefulWidget {
  const Ex5Screen({super.key});

  @override
  State<Ex5Screen> createState() => _Ex5ScreenState();
}

class _Ex5ScreenState extends State<Ex5Screen> {
  List<String> produtos = ['Produto A', 'Produto B', 'Produto C'];
  List<String> carrinho = [];

  @override
  void initState() {
    super.initState();
    loadCarrinho();
  }

  // 🔹 CARREGAR CARRINHO
  Future<void> loadCarrinho() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      carrinho = prefs.getStringList('carrinho') ?? [];
    });
  }

  // 🔹 ADICIONAR AO CARRINHO
  Future<void> addCarrinho(String produto) async {
    setState(() {
      carrinho.add(produto);
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('carrinho', carrinho);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 5'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Produtos',
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            // 🔹 LISTA DE PRODUTOS
            Expanded(
              child: ListView.builder(
                itemCount: produtos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(produtos[index]),
                    trailing: ElevatedButton(
                      onPressed: () => addCarrinho(produtos[index]),
                      child: const Text('Adicionar'),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Carrinho',
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            // 🔹 LISTA DO CARRINHO
            Expanded(
              child: ListView.builder(
                itemCount: carrinho.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(carrinho[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}