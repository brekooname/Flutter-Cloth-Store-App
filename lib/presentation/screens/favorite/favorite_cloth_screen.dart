import 'package:fasion_store/business_logic/blocs/cloth/cloth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/blocs/wishlist/wishlist_bloc.dart';
import '../home/widgets/cloth_grid.dart';

class FavoriteClothScreen extends StatelessWidget {
  const FavoriteClothScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
      if (state is WishlistLoaded) {
        if (state.wishlist.isNotEmpty) {
          return ClothGrid(
              cloths: state.wishlist);
        } else {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/favourite_cloths.png"),
            ),
          );
        }
      } else if (state is ClothLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return const Center(
          child: Text("Something Wrong!"),
        );
      }
    });
  }
}
