import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fasion_store/data/models/cloth.dart';
import 'package:fasion_store/data/repositories/cloth_repository.dart';
import 'package:flutter/material.dart';

part 'cloth_event.dart';
part 'cloth_state.dart';

class ClothBloc extends Bloc<ClothEvent, ClothState> {
  ClothBloc() : super(ClothLoading()) {
    on<LoadCloth>(_onLoadCloth);
    on<ToggleFavoriteCloth>(_onToggleFavoriteCloth);
  }

  void _onLoadCloth(LoadCloth event, Emitter<ClothState> emit) async {
    debugPrint("Loading Cloth...");
    try {
      var cloths = ClothRepository().tempCloths;
      emit(ClothLoaded(cloths: cloths));
    } catch (e) {
      debugPrint(e.toString());
      emit(ClothError());
    }
  }

  void _onToggleFavoriteCloth(
      ToggleFavoriteCloth event, Emitter<ClothState> emit) async {
    debugPrint("TogglingFavoriteCloth...");
    final state = this.state;
    if (state is ClothLoaded) {
      emit(ClothLoading());
      try {
        List<Cloth> _cloths = state.cloths;
        _cloths.firstWhere((element) => element.id == event.clothId)
                .isFavorite =
            !_cloths.firstWhere((element) => element.id == event.clothId)
                .isFavorite;
        emit(ClothLoaded(cloths: _cloths));
      } catch (e) {
        debugPrint(e.toString());
        emit(ClothError());
      }
    }
  }
}
