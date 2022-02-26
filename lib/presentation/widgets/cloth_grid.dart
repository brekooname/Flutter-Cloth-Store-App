import 'package:flutter/material.dart';

import '../../data/models/cloth.dart';
import '../screens/home/widgets/main_cloth_card.dart';

class ClothGrid extends StatelessWidget {
  final List<Cloth> cloths;
  const ClothGrid({Key? key, required this.cloths}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 12, 0),
      child: GridView.builder(
        itemCount: cloths.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.55,
          crossAxisSpacing: 6,
        ),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return MainClothCard(
            cloth: cloths[index],
          );
        },
      ),
    );
  }
}
