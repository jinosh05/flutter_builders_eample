import "package:bloc/bloc.dart";
import "package:meta/meta.dart";

part "universal_event.dart";
part "universal_state.dart";

class UniversalBloc extends Bloc<UniversalEvent, UniversalState> {
  UniversalBloc() : super(UniversalValueState(0)) {
    on<UniversalEvent>(
        (final UniversalEvent event, final Emitter<UniversalState> emit) {
      if (event is UniversalIncremetEvent) {
        ++nvalue;
        emit(UniversalValueState(nvalue));
      }
    });
  }

  int nvalue = 0;
}
