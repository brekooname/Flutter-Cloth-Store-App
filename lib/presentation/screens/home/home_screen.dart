import 'package:fasion_store/presentation/screens/home/widgets/cloth_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/blocs/cloth/cloth_bloc.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_title.dart';
import 'widgets/suggestion_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeAppBar(),
        const HomeTitle(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: TextField(
            autofocus: false,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 12),
                suffixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
                hintText: "Search",
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 3.0),
                  borderRadius: BorderRadius.circular(12)
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white, width: 3.0),
                )),
          ),
        ),
        const SuggestionList(),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: BlocBuilder<ClothBloc, ClothState>(
                builder: (context, state) {
                  if(state is ClothLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ClothLoaded) {
                    return ClothGrid(cloths: state.cloths);
                  } else {
                    return const Center(
                      child: Text("Something wrong!"),
                    );
                  }
                },
              ),
        ))
      ],
    );
  }
}
