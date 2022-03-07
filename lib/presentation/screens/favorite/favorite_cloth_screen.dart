import 'package:fasion_store/business_logic/blocs/cloth/cloth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/widgets/cloth_grid.dart';

class FavoriteClothScreen extends StatelessWidget {
  const FavoriteClothScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClothBloc, ClothState>(builder: (context, state) {
      if (state is ClothLoaded) {
        return ClothGrid(
            cloths: state.cloths.where((element) => element.isFavorite).toList());
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
