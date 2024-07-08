import "dart:math";

import "package:bloc/bloc.dart";
import "package:meta/meta.dart";

part "build_when_state.dart";

class BuildWhenCubit extends Cubit<BuildWhenState> {
  BuildWhenCubit() : super(BuildWhenCubitState(0));

  void generateRandNumber() {
    final int rand = Random().nextInt(100);
    emit(BuildWhenCubitState(rand));
  }
}
