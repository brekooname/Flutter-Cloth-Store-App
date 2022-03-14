import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    return Padding(
      padding:
      const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          SizedBox(height: 16,),
          // Icon(Icons.menu),
          // Icon(Icons.search),
          // AnimSearchBar(
          //   width: width-24,
          //   autoFocus: false,
          //   textController: textController,
          //   onSuffixTap: () {
          //     setState(() {
          //       textController.clear();
          //     });
          //   },
          // )
        ],
      ),
    );
  }
}
