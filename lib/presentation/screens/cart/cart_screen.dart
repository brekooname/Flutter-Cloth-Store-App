import 'package:fasion_store/data/models/cloth.dart';
import 'package:fasion_store/presentation/screens/cart/components/cart_cloth_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClothScreen extends StatelessWidget {
  const ClothScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: tempCloths.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Dismissible(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: CartClothCard(cloth: tempCloths[index]),
                      ),
                    onDismissed: (val){

                    }, key: Key(index.toString()),
                  );
                }),
          ),
          // CardClothCard(
          //   cloth: tempCloths.first,
          // ),
          // const SizedBox(
          //   height: 12,
          // ),
          // CardClothCard(
          //   cloth: tempCloths[1],
          // ),
          // const SizedBox(
          //   height: 12,
          // ),
          // CardClothCard(
          //   cloth: tempCloths[2],
          // ),
        ],
      ),
    );
  }
}
