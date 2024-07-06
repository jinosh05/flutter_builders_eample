part of "page_memory_bloc.dart";

@immutable
sealed class PageMemoryState {}

final class PageMemoryValueState extends PageMemoryState {
  PageMemoryValueState(this.value);
  final int value;
}
