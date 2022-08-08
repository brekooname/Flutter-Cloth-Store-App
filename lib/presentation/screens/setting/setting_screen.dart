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
              ),

            ],
          ),
        ),
        const SizedBox(height: 30),
        const SettingCard(
          title: "Profile",
        ),
        const SizedBox(height: 6),
        const SettingCard(
          title: "Settings",
        ),
        const SizedBox(height: 6),
        const SettingCard(
          title: "Notifications",
        ),
        const SizedBox(height: 6),
        const SettingCard(
          title: "About",
        ),
        const SizedBox(height: 6),
        const SettingCard(
          title: "Sign Out",
        ),
      ],
    );
  }
}

class SettingCard extends StatelessWidget {
  final String title;
  const SettingCard({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: (){

        },
        child: Card(
          color: Colors.white,
          elevation: 1,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
            child: Row(
              children: [
                Text(title,
                style: Theme.of(context).textTheme.titleSmall,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
