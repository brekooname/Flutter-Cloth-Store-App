import 'package:fasion_store/data/models/cloth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../business_logic/blocs/cart/cart_bloc.dart';

class ClothBottomNavigation extends StatelessWidget {
  final Cloth cloth;
  const ClothBottomNavigation({
    Key? key,
    required this.cloth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      height: 85,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "sub total",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              Text(
                '\$${cloth.price.toStringAsFixed(2)}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              context
                  .read<CartBloc>()
                  .add(AddCart(cloth: cloth));
              Navigator.pop(context);
            },
            child: const Text(
              "Add to Cart",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(vertical: 18, horizontal: 20)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
              ),
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          ElevatedButton(
            onPressed: () {
              context
                  .read<CartBloc>()
                  .add(AddCart(cloth: cloth));
              Navigator.pop(context);
            },
            child: const Text(
              "Buy",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(vertical: 18, horizontal: 42)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
