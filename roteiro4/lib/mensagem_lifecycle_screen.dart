import 'package:flutter/material.dart';

class MensagemLifecycleScreen extends StatefulWidget {
  const MensagemLifecycleScreen({super.key});

  @override
  State<MensagemLifecycleScreen> createState() =>
      _MensagemLifecycleScreenState();
}

class _MensagemLifecycleScreenState extends State<MensagemLifecycleScreen> {
  bool mensagemVisivel = true;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("Tela iniciada");
  }

  @override
  void dispose() {
    print("Tela finalizada");
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Tela reconstruída");

    return Scaffold(
      appBar: AppBar(title: const Text("Mensagem Lifecycle")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Digite algo",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            if (mensagemVisivel)
              const Text("Mensagem visível!", style: TextStyle(fontSize: 20)),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  mensagemVisivel = !mensagemVisivel;
                });
              },
              child: const Text("Mostrar/Esconder"),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Fechar tela"),
            ),
          ],
        ),
      ),
    );
  }
}
