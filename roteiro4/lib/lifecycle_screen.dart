import 'package:flutter/material.dart';

class LifeCycleScreen extends StatefulWidget {
  const LifeCycleScreen({super.key});

  @override
  State<LifeCycleScreen> createState() => _LifeCycleScreenState();
}

class _LifeCycleScreenState extends State<LifeCycleScreen> {
  @override
  void initState() {
    super.initState();
    print("initState: tela iniciada");
  }

  @override
  void dispose() {
    print("dispose: tela finalizada");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build: reconstruindo tela");

    return Scaffold(
      appBar: AppBar(title: const Text("Ciclo de Vida")),
      body: const Center(
        child: Text("Veja o console"),
      ),
    );
  }
}