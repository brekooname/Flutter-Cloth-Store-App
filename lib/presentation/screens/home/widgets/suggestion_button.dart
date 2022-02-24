import 'package:flutter/material.dart';

class SuggestionButton extends StatelessWidget {
  final String title;
  final Function onClick;
  final bool isSelected;
  const SuggestionButton(
      {Key? key,
      required this.title,
      required this.onClick,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onClick,
      child: Text(title,
      style: TextStyle(
          color: isSelected? Colors.white : Theme.of(context).colorScheme.secondary
      ),),
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(vertical: 18, horizontal: 32)),
          backgroundColor: MaterialStateProperty.all<Color>(
              isSelected ? Theme.of(context).colorScheme.secondary : Theme.of(context).backgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(color:
                  isSelected ? Theme.of(context).colorScheme.secondary : Theme.of(context).primaryColor)
              ),),),
    );
  }
}
