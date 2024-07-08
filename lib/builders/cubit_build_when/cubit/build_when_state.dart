part of "build_when_cubit.dart";

@immutable
sealed class BuildWhenState {}

final class BuildWhenCubitState extends BuildWhenState {
  BuildWhenCubitState(this.value);
  final int value;
}
