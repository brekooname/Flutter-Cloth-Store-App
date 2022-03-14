import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/models/cloth.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState>{
  CartBloc() : super(CartLoading()) {
    on<LoadCart>(_onLoadCart);
    on<AddCart>(_onAddCart);
    on<RemoveCart>(_onRemoveCart);
  }

  void _onLoadCart(LoadCart event, Emitter<CartState> emit) async {
    debugPrint("Loading Cart...");
    try {
      emit(const CartLoaded(cloths: <Cloth>[]));
    } catch (e) {
      debugPrint(e.toString());
      emit(CartError());
    }
  }

  void _onAddCart(AddCart event, Emitter<CartState> emit) async {
    try {
      final state = this.state;
      debugPrint("Cart Adding....");
      if (state is CartLoaded) {
        emit(CartLoaded(cloths: List.from(state.cloths)..add(event.cloth)));
        debugPrint(event.cloth.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(CartError());
    }
  }

  void _onRemoveCart(RemoveCart event, Emitter<CartState> emit) async {
    try {
      final state = this.state;
      debugPrint("Cart Removing....");
      if (state is CartLoaded) {
        emit(CartLoaded(cloths: List.from(state.cloths)..removeAt(event.index)));
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(CartError());
    }
  }
}
