import "dart:math";

import "package:bloc/bloc.dart";
import "package:meta/meta.dart";

part "cubit_base_state.dart";

class CubitBaseCubit extends Cubit<CubitBaseState> {
  CubitBaseCubit() : super(CubitBaseInitial());

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
