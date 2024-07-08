import "dart:math";

import "package:bloc/bloc.dart";
import "package:flutter/material.dart";

part "cubit_base_state.dart";

class CubitBaseCubit extends Cubit<CubitBaseState> {
  CubitBaseCubit() : super(CubitBaseInitial());

  ValueNotifier<int> randNotifier = ValueNotifier<int>(0);

  Future<void> getNumberAndEmit() async {
    emit(CubitBaseLoading());
    final int rand = await getRandomNumber();
    emit(CubitBaseLoaded(rand));
  }

  Future<int> getRandomNumber() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return Random().nextInt(100);
  }
}
