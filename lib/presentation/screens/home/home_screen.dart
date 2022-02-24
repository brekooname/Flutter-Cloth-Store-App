import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:fasion_store/data/models/cloth.dart';
import 'package:fasion_store/presentation/screens/home/widgets/main_cloth_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final iconList = <IconData>[
    Icons.brightness_5,
    Icons.brightness_4,
    Icons.brightness_6,
    Icons.brightness_7,
  ];

  @override
  Widget build(BuildContext context) {
    double _gridSize = MediaQuery.of(context).size.height * 0.86;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: Container(
            height: _gridSize,
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(_gridSize / 10),
                    bottomRight: Radius.circular(_gridSize / 10),
                ),
            ),
            // padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: _gridSize - 10,
                      margin: const EdgeInsets.only(top: 0),
                      child: PhysicalModel(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(_gridSize / 10 - 2),
                            bottomRight:
                            Radius.circular(_gridSize / 10 - 2)),
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Icon(Icons.menu),
                                  Icon(Icons.search),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                "Find your",
                                style: Theme.of(context).textTheme.headline5!.copyWith(
                                    fontWeight: FontWeight.w700, letterSpacing: 1.2),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                              child: Text(
                                "match style!",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(letterSpacing: 1.2),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12, top: 16),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                child: Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("Treading Now"),
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all<EdgeInsets>(
                                              const EdgeInsets.symmetric(
                                                  vertical: 18, horizontal: 32)),
                                          backgroundColor: MaterialStateProperty.all<Color>(
                                              Theme.of(context).colorScheme.secondary),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(12.0)))),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Treading Now",
                                        style: TextStyle(
                                            color: Theme.of(context).colorScheme.secondary),
                                      ),
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all<EdgeInsets>(
                                              const EdgeInsets.symmetric(
                                                  vertical: 18, horizontal: 32)),
                                          backgroundColor: MaterialStateProperty.all<Color>(
                                              Theme.of(context).backgroundColor),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12.0),
                                                  side: BorderSide(
                                                      color: Theme.of(context).primaryColor)))),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Treading Now",
                                          style: TextStyle(
                                              color: Theme.of(context).colorScheme.secondary),
                                        ),
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all<EdgeInsets>(
                                              const EdgeInsets.symmetric(
                                                  vertical: 18, horizontal: 32)),
                                          backgroundColor: MaterialStateProperty.all<Color>(
                                              Theme.of(context).backgroundColor),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12.0),
                                                  side: BorderSide(
                                                      color:
                                                      Theme.of(context).primaryColor))),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 12, 12, 0),
                                child: GridView.builder(
                                  itemCount: tempCloths.length,
                                  gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.55,
                                    crossAxisSpacing: 6,
                                  ),
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (BuildContext context, int index) {
                                    return MainClothCard(
                                      cloth: tempCloths[index],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.10,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 0
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.home,
                color: Colors.white,),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  elevation: 0,
                  padding: const EdgeInsets.all(8),
                  primary: Theme.of(context).primaryColor, // <-- Button color
                  onPrimary: Colors.red, // <-- Splash color
                ),
              ),
              Icon(Icons.category,
                color: Colors.white,),
              Icon(Icons.shopping_cart_outlined,
                color: Colors.white,),
              Icon(Icons.settings,
                color: Colors.white,)
            ],
          ),
        ),
      ),
    );
  }
}
