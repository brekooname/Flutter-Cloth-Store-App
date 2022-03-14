import 'package:fasion_store/business_logic/blocs/cart/cart_bloc.dart';
import 'package:fasion_store/presentation/screens/cart/components/cart_cloth_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if(state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if(state is CartLoaded) {
            if(state.cloths.isNotEmpty){
              return ListView.builder(
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
                  });
            } else {
              return Center(
                child: Image.asset('assets/images/cart_cloths.png'),
              );
            }
          } else {
            return const Center(
              child: Text("Something Wrong!"),
            );
          }
        },
      ),
    );
  }
}
