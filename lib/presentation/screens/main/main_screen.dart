import 'package:fasion_store/presentation/screens/cart/cart_screen.dart';
import 'package:fasion_store/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import '../favorite/favorite_cloth_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // final BorderRadius _borderRadius = const BorderRadius.only(
  //   topLeft: Radius.circular(25),
  //   topRight: Radius.circular(25),
  // );

  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.all(12);

  int _selectedItemPosition = 0;
  SnakeShape snakeShape = SnakeShape.circle;

  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;

  Color selectedColor = Colors.black;
  Color unselectedColor = Colors.blueGrey;

  Gradient selectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.amber]);
  Gradient unselectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.blueGrey]);

  final PageController controller = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: PhysicalModel(
          color: Theme.of(context).backgroundColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)),
          clipBehavior: Clip.antiAlias,
          child: SafeArea(
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                children: <Widget>[
                  const HomeScreen(),
                  const FavoriteClothScreen(),
                  const CartScreen(),
                  Container(),
                ],
              ),
            ),
          )),
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.circle,
        padding: const EdgeInsets.all(12),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        snakeViewColor: Theme.of(context).primaryColor,
        selectedItemColor: SnakeShape.circle == SnakeShape.indicator
            ? Theme.of(context).primaryColor
            : null,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: _selectedItemPosition,
        onTap: (index) => setState(() {
          controller.animateToPage(index,
              duration: const Duration(milliseconds: 400),
              curve: Curves.linear);
          _selectedItemPosition = index;
        }),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'cart'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings')
        ],
      ),
    );
  }
}
