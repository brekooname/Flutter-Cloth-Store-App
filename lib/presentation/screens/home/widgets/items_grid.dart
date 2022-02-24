import 'package:flutter/material.dart';

import '../../../../data/models/cloth.dart';
import 'main_cloth_card.dart';

class ItemsGrid extends StatelessWidget {
  const ItemsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 12, 12, 0),
        child: GridView.builder(
          itemCount: tempCloths.length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.55,
            crossAxisSpacing: 6,
          ),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return MainClothCard(
              cloth: tempCloths[index],
            );
          },
        ),
      ),
    );
  }
}
