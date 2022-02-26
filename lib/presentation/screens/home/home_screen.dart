import 'package:fasion_store/data/models/cloth.dart';
import 'package:fasion_store/presentation/widgets/cloth_grid.dart';
import 'package:flutter/material.dart';

import 'widgets/home_appbar.dart';
import 'widgets/home_title.dart';
import 'widgets/suggestion_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeAppBar(),
        const HomeTitle(),
        const SuggestionList(),
        Expanded(child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ClothGrid(cloths: tempCloths),
        ))
      ],
    );
  }
}
