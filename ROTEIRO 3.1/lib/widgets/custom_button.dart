import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  final Color cor;

  const CustomButton({
    super.key, 
    required this.texto, 
    required this.onPressed, 
    this.cor = Colors.blue
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: cor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
      onPressed: onPressed,
      child: Text(texto),
    );
  }
}