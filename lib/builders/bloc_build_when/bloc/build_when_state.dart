part of "build_when_bloc.dart";

@immutable
sealed class BuildWhenState {}

final class BuildWhenDefaultState extends BuildWhenState {
  BuildWhenDefaultState(this.value);
  final int value;
}
