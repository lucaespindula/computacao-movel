import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ex4Screen extends StatefulWidget {
  const Ex4Screen({super.key});

  @override
  State<Ex4Screen> createState() => _Ex4ScreenState();
}

class _Ex4ScreenState extends State<Ex4Screen> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  // 🔹 CARREGAR DADOS SALVOS
  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      nomeController.text = prefs.getString('nome') ?? '';
      emailController.text = prefs.getString('email') ?? '';
    });
  }

  // 🔹 SALVAR NOME
  Future<void> saveNome(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nome', value);
  }

  // 🔹 SALVAR EMAIL
  Future<void> saveEmail(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 4'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
              onChanged: saveNome, // 🔥 AUTO SAVE
            ),

            const SizedBox(height: 20),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              onChanged: saveEmail, // 🔥 AUTO SAVE
            ),
          ],
        ),
      ),
    );
  }
}