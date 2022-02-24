import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }
}
