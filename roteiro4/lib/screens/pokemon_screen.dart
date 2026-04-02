import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../models/pokemon.dart';
import '../services/pokemon_service.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  final TextEditingController controller = TextEditingController();
  final AudioPlayer player = AudioPlayer();
  final PokemonService service = PokemonService();

  Pokemon? pokemon;
  bool isLoading = false;
  String erro = '';
  int currentId = 1;

  @override
  void initState() {
    super.initState();
    buscar('1'); //ex7
  }

  Future<void> buscar(String termo) async {
    setState(() {
      isLoading = true;
      erro = '';
    });

    try {
      final result = await service.fetchPokemon(termo);

      setState(() {
        pokemon = result;
        currentId = result.id;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        erro = "Pokémon não encontrado";
        pokemon = null;
        isLoading = false;
      });
    }
  }

  Future<void> tocarSom() async {
    if (pokemon != null && pokemon!.cryUrl.isNotEmpty) {
      await player.stop();
      await player.play(UrlSource(pokemon!.cryUrl));
    }
  }

  void proximo() {
    buscar('${currentId + 1}');
  }

  void anterior() {
    if (currentId > 1) {
      buscar('${currentId - 1}');
    }
  }

  @override
  void dispose() {
    controller.dispose();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pokédex"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            //ex4
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Digite nome ou número",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  buscar(controller.text);
                }
              },
              child: const Text("Buscar"),
            ),

            const SizedBox(height: 20),

            if (isLoading) const CircularProgressIndicator(),

            //ex5
            if (erro.isNotEmpty)
              Text(erro, style: const TextStyle(fontSize: 18)),

            if (!isLoading && pokemon != null)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //ex1 e 2
                    Text(
                      pokemon!.name,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Número: ${pokemon!.id}",
                      style: const TextStyle(fontSize: 20),
                    ),

                    const SizedBox(height: 20),

                    //ex3
                    if (pokemon!.imageUrl.isNotEmpty)
                      Image.network(pokemon!.imageUrl, height: 200),

                    const SizedBox(height: 20),

                    //ex6
                    ElevatedButton.icon(
                      onPressed: tocarSom,
                      icon: const Icon(Icons.volume_up),
                      label: const Text("Tocar som"),
                    ),

                    const SizedBox(height: 20),

                    //exfinal
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: anterior,
                          child: const Text("Anterior"),
                        ),
                        ElevatedButton(
                          onPressed: proximo,
                          child: const Text("Próximo"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
