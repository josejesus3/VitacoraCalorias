import 'package:flutter/material.dart';

class ListTitleContent extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const ListTitleContent(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
