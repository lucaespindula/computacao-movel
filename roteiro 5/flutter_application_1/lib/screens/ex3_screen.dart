import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ex3Screen extends StatefulWidget {
  const Ex3Screen({super.key});

  @override
  State<Ex3Screen> createState() => _Ex3ScreenState();
}

class _Ex3ScreenState extends State<Ex3Screen> {
  String currentPage = 'A';

  @override
  void initState() {
    super.initState();
    loadPage();
  }

  // 🔹 CARREGAR PÁGINA SALVA
  Future<void> loadPage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      currentPage = prefs.getString('last_page') ?? 'A';
    });
  }

  // 🔹 SALVAR PÁGINA
  Future<void> savePage(String page) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_page', page);
  }

  // 🔹 AO CLICAR
  void changePage(String page) async {
    setState(() {
      currentPage = page;
    });

    await savePage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 3'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Página atual: $currentPage',
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => changePage('A'),
              child: const Text('Página A'),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () => changePage('B'),
              child: const Text('Página B'),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () => changePage('C'),
              child: const Text('Página C'),
            ),
          ],
        ),
      ),
    );
  }
}