import "dart:math";

import "package:bloc/bloc.dart";
import "package:meta/meta.dart";

part "async_event.dart";
part "async_state.dart";

class AsyncBloc extends Bloc<AsyncEvent, AsyncState> {
  AsyncBloc() : super(AsyncInitial()) {
    on<AsyncEvent>(
        (final AsyncEvent event, final Emitter<AsyncState> emit) async {
      if (event is GetRandomNumEvent) {
        emit(AsyncLoading());
        final int data = await getRandomNumber();
        emit(AsyncLoaded(data));
      }
    });
  }

  Future<int> getRandomNumber() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    return Random().nextInt(100);
  }
}
