import 'package:fasion_store/business_logic/blocs/cart/cart_bloc.dart';
import 'package:fasion_store/data/models/cloth.dart';
import 'package:fasion_store/presentation/screens/cart/components/cart_cloth_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClothScreen extends StatelessWidget {
  const ClothScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if(state is CartLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if(state is CartLoaded) {
                print(state.cloths.length);
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.cloths.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Dismissible(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: CartClothCard(cloth: state.cloths[index]),
                          ),
                          onDismissed: (val){
                            context
                                .read<CartBloc>()
                                .add(RemoveCart(index: index));
                          }, key: Key(index.toString()),
                        );
                      }),
                );
              } else {
                return const Center(
                  child: Text("Something Wrong!"),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
