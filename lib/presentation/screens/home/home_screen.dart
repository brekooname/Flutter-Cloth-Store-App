import 'package:fasion_store/presentation/screens/home/widgets/home_appbar.dart';
import 'package:fasion_store/presentation/screens/home/widgets/home_title.dart';
import 'package:fasion_store/presentation/screens/home/widgets/items_grid.dart';
import 'package:fasion_store/presentation/screens/home/widgets/suggestion_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
            padding: const EdgeInsets.only(left: 4),
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
                          children: const [
                            HomeAppBar(),
                            HomeTitle(),
                            SuggestionList(),
                            ItemsGrid()
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
                child: const Icon(Icons.home,
                color: Colors.white,),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  elevation: 0,
                  padding: const EdgeInsets.all(8),
                  primary: Theme.of(context).primaryColor, // <-- Button color
                  onPrimary: Colors.red, // <-- Splash color
                ),
              ),
              const Icon(Icons.category,
                color: Colors.white,),
              const Icon(Icons.shopping_cart_outlined,
                color: Colors.white,),
              const Icon(Icons.settings,
                color: Colors.white,)
            ],
          ),
        ),
      ),
    );
  }
}
