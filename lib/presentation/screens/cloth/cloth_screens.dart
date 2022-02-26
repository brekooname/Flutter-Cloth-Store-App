import 'dart:ui';

import 'package:fasion_store/data/models/cloth.dart';
import 'package:fasion_store/presentation/widgets/favorite_cloth_button.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ClothScreen extends StatelessWidget {
  final Cloth cloth;
  const ClothScreen({Key? key, required this.cloth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: PhysicalModel(
          color: Theme.of(context).backgroundColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight:
              Radius.circular(40)),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(cloth.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: ()=>Navigator.pop(context), icon: const Icon(
                        Icons.arrow_back_outlined
                    )),
                    FavoriteClothButton(
                      status: cloth.isFavorite,
                      onClick: (){},
                    )
                  ],
                ),
              ),
              SlidingUpPanel(
                renderPanelSheet: false,
                panel: _floatingPanel(
                  cloth.description
                ),
                collapsed: _floatingCollapsed(),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.secondary,
        height: 85,
        padding: const EdgeInsets.symmetric(
          horizontal: 16
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("sub total",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16
                ),),
                Text('\$${cloth.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Add to Cart",
                style: TextStyle(
                    color: Colors.white
                ),),
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 38)),
                backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)
                  ),),),
            )
          ],
        ),
      ),
    );
  }

  Widget _floatingCollapsed(){
    return Container(
      decoration: const BoxDecoration(
        // color: Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            RotatedBox(
                quarterTurns: 3,
                child: Icon(Icons.double_arrow_sharp,
                  color: Colors.white,),
            ),
            Text(
              "Swipe up to details",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget _floatingPanel(String description){
    return Container(
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10
      ),
      child: Center(
        child: Text(description,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16
          ),),
      ),
    );
  }
}
