import 'package:fasion_store/presentation/screens/home/widgets/home_appbar.dart';
import 'package:fasion_store/presentation/screens/home/widgets/home_title.dart';
import 'package:fasion_store/presentation/screens/home/widgets/items_grid.dart';
import 'package:fasion_store/presentation/screens/home/widgets/suggestion_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );

  EdgeInsets padding = const EdgeInsets.all(12);

  int _selectedItemPosition = 2;

  SnakeShape snakeShape = SnakeShape.circle;

  bool showSelectedLabels = false;

  bool showUnselectedLabels = false;

  Color selectedColor = Colors.black;

  Color unselectedColor = Colors.blueGrey;

  Gradient selectedGradient =
  const LinearGradient(colors: [Colors.red, Colors.amber]);

  Gradient unselectedGradient =
  const LinearGradient(colors: [Colors.red, Colors.blueGrey]);

  Color? containerColor;

  List<Color> containerColors = [
    const Color(0xFFFDE1D7),
    const Color(0xFFE4EDF5),
    const Color(0xFFE7EEED),
    const Color(0xFFF4E4CE),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: PhysicalModel(
          color: Theme.of(context).backgroundColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(60),
              bottomRight:
              Radius.circular(60)),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HomeAppBar(),
              HomeTitle(),
              SuggestionList(),
              ItemsGrid()
            ],
          ),
        ),
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.circle,
        padding: padding,
        backgroundColor: Theme.of(context).colorScheme.secondary,

        snakeViewColor: Theme.of(context).primaryColor,
        selectedItemColor: snakeShape == SnakeShape.indicator ? Theme.of(context).primaryColor : null,
        unselectedItemColor: Colors.white,

        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,

        currentIndex: _selectedItemPosition,
        onTap: (index) => setState(() => _selectedItemPosition = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'category'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'cart'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings')
        ],
      ),
    );
  }
}
