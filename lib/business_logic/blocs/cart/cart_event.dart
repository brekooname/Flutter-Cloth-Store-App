part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class LoadCart extends CartEvent {
  @override
  List<Object> get props => [];
}

class AddCart extends CartEvent {
  final Cloth cloth;
  const AddCart({required this.cloth});

  @override
  List<Object> get props => [cloth];
}

class RemoveCart extends CartEvent {
  final int index;
  const RemoveCart({required this.index});

  @override
  List<Object> get props => [index];
}

