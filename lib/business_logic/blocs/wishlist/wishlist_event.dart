part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();
}

class LoadWishlist extends WishlistEvent {
  @override
  List<Object> get props => [];
}

class ToggleWishlist extends WishlistEvent {
  final Cloth cloth;
  const ToggleWishlist({required this.cloth});

  @override
  List<Object> get props => [cloth];
}

// class AddWishlist extends WishlistEvent {
//   final Cloth cloth;
//   const AddWishlist({required this.cloth});
//
//   @override
//   List<Object> get props => [cloth];
// }
//
// class RemoveWishlist extends WishlistEvent {
//   final Cloth cloth;
//   const RemoveWishlist({required this.cloth});
//
//   @override
//   List<Object> get props => [cloth];
// }