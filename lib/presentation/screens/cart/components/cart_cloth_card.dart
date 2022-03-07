import 'package:fasion_store/data/models/cloth.dart';
import 'package:flutter/material.dart';

class CartClothCard extends StatelessWidget {
  final Cloth cloth;
  const CartClothCard({Key? key, required this.cloth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                cloth.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                cloth.name,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(
                height: 4,
              ),
              Text('\$${cloth.price.toStringAsFixed(2)}')
            ],
          ),
        )
      ],
    );
  }
}
