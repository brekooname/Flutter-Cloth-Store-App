import 'package:equatable/equatable.dart';

class Cloth extends Equatable {
  final int id;
  final String name;
  final String image;
  final String description;
  final double price;
  final double? discountPrice;

  const Cloth({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    this.discountPrice,
  });

  @override
  List<Object?> get props =>
      [id, name, image, description, price, discountPrice];
}
