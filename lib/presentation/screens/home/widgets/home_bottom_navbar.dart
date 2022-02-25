import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class HomeBottomNavbar extends StatefulWidget {
  const HomeBottomNavbar({Key? key}) : super(key: key);

  @override
  State<HomeBottomNavbar> createState() => _HomeBottomNavbarState();
}

class _HomeBottomNavbarState extends State<HomeBottomNavbar> {
  int _selectedItemPosition = 0;

  @override
  Widget build(BuildContext context) {
    return SnakeNavigationBar.color(
      behaviour: SnakeBarBehaviour.floating,
      snakeShape: SnakeShape.circle,
      padding: const EdgeInsets.all(12),
      backgroundColor: Theme.of(context).colorScheme.secondary,

      snakeViewColor: Theme.of(context).primaryColor,
      selectedItemColor: SnakeShape.circle == SnakeShape.indicator ? Theme.of(context).primaryColor : null,
      unselectedItemColor: Colors.white,

      showUnselectedLabels: false,
      showSelectedLabels: false,

      currentIndex: _selectedItemPosition,
      onTap: (index) => setState(() => _selectedItemPosition = index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.category), label: 'category'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'cart'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings')
      ],
    );
  }
}
