import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../models/product.dart';
import 'cart_screen.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  final List<Product> products = const [
    Product(nome: 'Arroz', preco: 5.00),
    Product(nome: 'Feijão', preco: 7.50),
    Product(nome: 'Macarrão', preco: 4.20),
    Product(nome: 'Leite', preco: 6.00),
    Product(nome: 'Café', preco: 12.00),
  ];

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Loja'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text('(${cart.totalItems})'),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CartScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return ListTile(
            title: Text(product.nome),
            subtitle: Text('R\$ ${product.preco.toStringAsFixed(2)}'),
            trailing: ElevatedButton(
              onPressed: () {
                context.read<CartProvider>().addProduct(product);
              },
              child: const Text('Adicionar'),
            ),
          );
        },
      ),
    );
  }
}
