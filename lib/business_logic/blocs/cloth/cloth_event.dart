part of 'cloth_bloc.dart';

abstract class ClothEvent extends Equatable {
  const ClothEvent();
}

class LoadCloth extends ClothEvent {
  @override
  List<Object> get props => [];
}

class ToggleFavoriteCloth extends ClothEvent {
  final int clothId;
  const ToggleFavoriteCloth({required this.clothId});

  @override
  List<Object> get props => [clothId];
}

