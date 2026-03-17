import 'package:flutter/material.dart';
import 'list_screen.dart'; // Importa a tela da lista
import 'profile_screen.dart'; // Importa a tela de perfil
import '../widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Minha Loja")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Bem-vindo!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            CustomButton(
              texto: "Ver Produtos",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ListScreen()));
              },
            ),
            const SizedBox(height: 15),
            CustomButton(
              texto: "Meu Perfil",
              cor: Colors.green,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}