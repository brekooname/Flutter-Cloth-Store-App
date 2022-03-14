import 'package:fasion_store/data/models/cloth.dart';
import 'package:fasion_store/presentation/screens/cloth/cloth_screens.dart';
import 'package:fasion_store/presentation/widgets/favorite_cloth_button.dart';
import 'package:flutter/material.dart';

class MainClothCard extends StatelessWidget {
  final Cloth cloth;
  final Function onFavoriteToggle;
  const MainClothCard({
    Key? key,
    required this.cloth,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ClothScreen(cloth: cloth)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Card(
                  color: Colors.black,
                  elevation: 5,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Hero(
                    tag: cloth.id,
                    child: Material(
                      child: GridTile(
                        footer: Container(),
                        child: Image.asset(
                          cloth.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
                  child: Text(cloth.name,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
                  child: Row(
                    children: [
                      Text(
                        r'$' + cloth.price.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: cloth.discountPrice == null
                              ? Colors.black87
                              : Colors.grey,
                          decoration: cloth.discountPrice == null
                              ? null
                              : TextDecoration.lineThrough,
                        ),
                      ),
                      cloth.discountPrice == null
                          ? const SizedBox()
                          : Text(
                              ' \$${cloth.discountPrice}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 10,
              right: 0,
              child: FavoriteClothButton(
                cloth: cloth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
