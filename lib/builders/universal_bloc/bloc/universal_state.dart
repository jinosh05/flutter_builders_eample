part of "universal_bloc.dart";

@immutable
sealed class UniversalState {}

final class UniversalValueState extends UniversalState {
  UniversalValueState(this.value);
  final int value;
}
