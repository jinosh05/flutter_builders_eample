import "package:bloc/bloc.dart";
import "package:meta/meta.dart";

part "page_memory_event.dart";
part "page_memory_state.dart";

class PageMemoryBloc extends Bloc<PageMemoryEvent, PageMemoryState> {
  PageMemoryBloc() : super(PageMemoryValueState(0)) {
    on<PageMemoryEvent>(
        (final PageMemoryEvent event, final Emitter<PageMemoryState> emit) {
      if (event is PageMemoryIncremnetEvent) {
        ++nvalue;
        emit(PageMemoryValueState(nvalue));
      }
    });
  }

  int nvalue = 0;
}
