import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho (${cart.totalItems})'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {
              _confirmClear(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: cart.products.isEmpty
                ? const Center(child: Text('Carrinho vazio'))
                : ListView.builder(
                    itemCount: cart.products.length,
                    itemBuilder: (context, index) {
                      final product = cart.products[index];

                      return ListTile(
                        title: Text(product.nome),
                        subtitle: Text(
                          'R\$ ${product.preco.toStringAsFixed(2)}',
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            context.read<CartProvider>().removeProduct(index);
                          },
                        ),
                      );
                    },
                  ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            color: Colors.grey[200],
            child: Text(
              'Total: R\$ ${cart.totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _confirmClear(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Limpar carrinho'),
          content: const Text('Deseja remover todos os itens?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                context.read<CartProvider>().clearCart();
                Navigator.pop(context);
              },
              child: const Text('Limpar'),
            ),
          ],
        );
      },
    );
  }
}
