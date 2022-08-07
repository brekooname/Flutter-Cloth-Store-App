import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children:  [
              const CircleAvatar(
                radius: 40.0,
                backgroundImage:
                AssetImage('assets/user/profile-picture.jpg'),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Wanda R. Fincher",
                  style: Theme.of(context).textTheme.headline6,),
                  const Text("WandaRFincher@teleworm.us")
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
