import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottonNavigator extends StatelessWidget {
  final int pageView;
  const BottonNavigator({super.key, required this.pageView});

  @override
  Widget build(BuildContext context) {
    void selectIndex(BuildContext context, int currentIndex) {
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
      onTap: (value) => selectIndex(context, value),
      currentIndex: pageView,
      items: const [
        BottomNavigationBarItem(label: '', icon: Icon(Icons.house_outlined)),
        BottomNavigationBarItem(
            label: '', icon: Icon(Icons.format_list_bulleted))
      ],
    );
  }
}
