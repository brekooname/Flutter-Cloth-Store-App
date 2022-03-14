import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/models/cloth.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<LoadWishlist>(_onLoadWishlist);
    on<ToggleWishlist>(_onToggleWishlist);
    // on<AddWishlist>(_onAddWishlist);
    // on<RemoveWishlist>(_onRemoveWishlist);
  }

  void _onLoadWishlist(LoadWishlist event, Emitter<WishlistState> emit) async {
    debugPrint("Loading Wishlist...");
    try {
      emit(const WishlistLoaded(wishlist: <Cloth>[]));
    } catch (e) {
      debugPrint(e.toString());
      emit(WishlistError());
    }
  }

  void _onToggleWishlist(ToggleWishlist event, Emitter<WishlistState> emit) async {
    try {
      final state = this.state;
      debugPrint("Wishlist Adding....");
      if (state is WishlistLoaded) {
        if(state.wishlist.any((element) => element==event.cloth)){
          emit(WishlistLoaded(
              wishlist: List.from(state.wishlist)..remove(event.cloth)));
        } else {
          emit(WishlistLoaded(
              wishlist: List.from(state.wishlist)..add(event.cloth)));
        }
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(WishlistError());
    }
  }

  // void _onAddWishlist(AddWishlist event, Emitter<WishlistState> emit) async {
  //   try {
  //     final state = this.state;
  //     debugPrint("Wishlist Adding....");
  //     if (state is WishlistLoaded) {
  //       emit(WishlistLoaded(
  //           wishlist: List.from(state.wishlist)..add(event.cloth)));
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     emit(WishlistError());
  //   }
  // }
  //
  // void _onRemoveWishlist(
  //     RemoveWishlist event, Emitter<WishlistState> emit) async {
  //   try {
  //     final state = this.state;
  //     debugPrint("Wishlist Removing....");
  //     if (state is WishlistLoaded) {
  //       emit(WishlistLoaded(
  //           wishlist: List.from(state.wishlist)..remove(event.cloth)));
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     emit(WishlistError());
  //   }
  // }
}
