import 'package:flutter/material.dart';

class FavoriteClothButton extends StatelessWidget {
  final bool status;
  final Function onClick;
  const FavoriteClothButton({Key? key,
  required this.status,
  required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ()=>onClick(),
      child: Icon(
          status ? Icons.favorite : Icons.favorite_border,
          color: Theme.of(context).primaryColor),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        elevation: 0,
        padding: const EdgeInsets.all(6),
        primary: Colors.white,
        onPrimary: Colors.red,
      ),
    );
  }
}
