import 'package:fasion_store/business_logic/blocs/wishlist/wishlist_bloc.dart';
import 'package:fasion_store/data/models/cloth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteClothButton extends StatelessWidget {
  final Cloth cloth;
  const FavoriteClothButton({
    Key? key,
    required this.cloth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context
            .read<WishlistBloc>()
            .add(ToggleWishlist(cloth: cloth));
      },
      child: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoaded) {
            return Icon(
                state.wishlist.any((element) => element == cloth)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Theme.of(context).primaryColor);
          } else {
            return const SizedBox();
          }
        },
      ),
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
