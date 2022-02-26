import 'package:fasion_store/data/models/cloth.dart';
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
          Row(
            children: [
              SizedBox(
                width: 100,
                child: AspectRatio(
                  aspectRatio: 0.88,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      tempCloths.first.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              // Flexible(
              //     child: ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      tempCloths.first.name,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text('\$${tempCloths.first.price.toStringAsFixed(2)}')
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              SizedBox(
                width: 100,
                child: AspectRatio(
                  aspectRatio: 0.88,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      tempCloths[1].image,
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
                      tempCloths[1].name,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text('\$${tempCloths.first.price.toStringAsFixed(2)}')
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
