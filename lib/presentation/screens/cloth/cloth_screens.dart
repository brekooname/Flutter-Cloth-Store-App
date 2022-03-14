import 'package:fasion_store/business_logic/blocs/cloth/cloth_bloc.dart';
import 'package:fasion_store/data/models/cloth.dart';
import 'package:fasion_store/presentation/screens/cloth/widgets/cloth_botton_navigation.dart';
import 'package:fasion_store/presentation/widgets/favorite_cloth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              bottomRight: Radius.circular(40)),
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
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_outlined)),
                    BlocBuilder<ClothBloc, ClothState>(
                      builder: (context, state) => FavoriteClothButton(
                        cloth: cloth,
                      ),
                    ),
                  ],
                ),
              ),
              SlidingUpPanel(
                renderPanelSheet: false,
                panel: _floatingPanel(cloth.description),
                collapsed: _floatingCollapsed(),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClothBottomNavigation(
        cloth: cloth,
      ),
    );
  }

  Widget _floatingCollapsed() {
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
              child: Icon(
                Icons.double_arrow_sharp,
                color: Colors.white,
              ),
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

  Widget _floatingPanel(String description) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Text(
          description,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
