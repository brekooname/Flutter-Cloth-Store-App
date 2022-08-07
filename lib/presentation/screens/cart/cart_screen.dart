import 'package:fasion_store/business_logic/blocs/cart/cart_bloc.dart';
import 'package:fasion_store/presentation/screens/cart/components/cart_cloth_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CartLoaded) {
            if (state.cloths.isNotEmpty) {
              return Stack(
                children: [
                  ListView.builder(
                      itemCount: state.cloths.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Dismissible(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: CartClothCard(cloth: state.cloths[index]),
                          ),
                          onDismissed: (val) {
                            context
                                .read<CartBloc>()
                                .add(RemoveCart(index: index));
                          },
                          key: Key(index.toString()),
                        );
                      }),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0),
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                          ),
                        color: Colors.black.withOpacity(0.6)
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Total Numbers Items :",
                                style: TextStyle(color: Colors.white),
                                ),
                                Text("x${state.cloths.length}",
                                  style: const TextStyle(color: Colors.white),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Total Price :",
                                  style: TextStyle(color: Colors.white),),
                                Text("\$ ${state.getTotal()}",
                                  style: TextStyle(color: Colors.white),)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
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
