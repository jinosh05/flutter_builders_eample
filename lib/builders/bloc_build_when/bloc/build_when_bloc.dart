import "dart:math";

import "package:bloc/bloc.dart";
import "package:meta/meta.dart";

part "build_when_event.dart";
part "build_when_state.dart";

class BuildWhenBloc extends Bloc<BuildWhenEvent, BuildWhenState> {
  BuildWhenBloc() : super(BuildWhenDefaultState(0)) {
    on<BuildWhenEvent>(
        (final BuildWhenEvent event, final Emitter<BuildWhenState> emit) {
      if (event is GenerateRandEvent) {
        final int rand = Random().nextInt(100);
        emit(BuildWhenDefaultState(rand));
      }
    });
  }
}
