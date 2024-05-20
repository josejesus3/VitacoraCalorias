import 'package:flutter/material.dart';

class BotonesConfirmacion extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final IconData icon;
  const BotonesConfirmacion({
    super.key,
    required this.onPressed,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(
          Color(0xFF39E079),
        ),
        minimumSize: MaterialStateProperty.all(const Size(50, 50)),
      ),
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(title),
    );
  }
}
