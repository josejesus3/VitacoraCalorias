import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vitacora_calorias/presentation/screen/home_screen.dart';

class BottonNavigator extends StatelessWidget {
  final int pageView;
  const BottonNavigator({super.key, required this.pageView});

  @override
  Widget build(BuildContext context) {
    void selectIndex(int currentIndex) {
      switch (currentIndex) {
        case 0:
          context.go('/home/0');

          break;
        case 1:
          context.go('/home/1');

          break;
        default:
      }
    }

    return BottomNavigationBar(
      onTap: (value) => selectIndex(value),
      currentIndex: pageView,
      items: const [
        BottomNavigationBarItem(label: '', icon: Icon(Icons.house_outlined)),
        BottomNavigationBarItem(
            label: '', icon: Icon(Icons.format_list_bulleted))
      ],
    );
  }
}
