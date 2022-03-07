part of 'cloth_bloc.dart';

abstract class ClothState extends Equatable {
  const ClothState();
}

class ClothLoading extends ClothState {
  @override
  List<Object> get props => [];
}

class ClothLoaded extends ClothState {
  final List<Cloth> cloths;
  const ClothLoaded({required this.cloths});

  @override
  List<Object> get props => [cloths];
}


class ClothError extends ClothState {
  @override
  List<Object> get props => [];
}
