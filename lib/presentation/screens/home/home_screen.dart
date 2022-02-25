import 'package:fasion_store/presentation/screens/home/widgets/home_appbar.dart';
import 'package:fasion_store/presentation/screens/home/widgets/home_bottom_navbar.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: PhysicalModel(
          color: Theme.of(context).backgroundColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight:
              Radius.circular(40)),
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
      bottomNavigationBar: const HomeBottomNavbar(),
    );
  }
}
