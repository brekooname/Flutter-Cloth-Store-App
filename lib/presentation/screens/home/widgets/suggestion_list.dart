import 'package:fasion_store/presentation/screens/home/widgets/suggestion_button.dart';
import 'package:flutter/material.dart';

class SuggestionList extends StatelessWidget {
  const SuggestionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: SuggestionButton(
                  title: "Treading Now",
                  onClick: (){},
                  isSelected: true
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            SuggestionButton(
                title: "New Arrival",
                onClick: (){},
                isSelected: false
            ),
            const SizedBox(
              width: 12,
            ),
            SuggestionButton(
                title: "Special Offers",
                onClick: (){},
                isSelected: false
            ),
          ],
        ),
      ),
    );
  }
}
