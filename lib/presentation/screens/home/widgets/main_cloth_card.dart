import 'package:fasion_store/data/models/cloth.dart';
import 'package:flutter/material.dart';

class MainClothCard extends StatelessWidget {
  final Cloth cloth;
  const MainClothCard({Key? key, required this.cloth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: () {},
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
                    // side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Hero(
                    tag: cloth.id,
                    child: Material(
                      child: InkWell(
                        onTap: () {},
                        child: GridTile(
                          footer: Container(),
                          child: Image.asset(
                            cloth.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
                  child: Text(cloth.name,
                      style: const TextStyle(
                          // fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
                  child: Row(
                    children: [
                      Text(r'$' + cloth.price.toString(),
                        style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600,
                          color: cloth.discountPrice==null?Colors.black87:Colors.grey,
                          decoration: cloth.discountPrice==null?null:TextDecoration.lineThrough,
                        ),),
                      cloth.discountPrice==null?
                          const SizedBox():
                      Text(' \$${cloth.discountPrice}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600
                        ),
                      )
                    ],
                  ),
                  // child: Text(
                  //   r'$' + cloth.price.toString(),
                  //   style: const TextStyle(
                  //       fontSize: 16, fontWeight: FontWeight.w600),
                  // ),
                )
              ],
            ),
            Positioned(
              top: 10,
              right: 0,
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(
                    cloth.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Theme.of(context).primaryColor),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  elevation: 0,
                  padding: const EdgeInsets.all(6),
                  primary: Colors.white, // <-- Button color
                  onPrimary: Colors.red, // <-- Splash color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
