part of "cubit_base_cubit.dart";

@immutable
sealed class CubitBaseState {}

final class CubitBaseInitial extends CubitBaseState {}

final class CubitBaseLoading extends CubitBaseState {}

final class CubitBaseLoaded extends CubitBaseState {
  CubitBaseLoaded(this.value);
  final int value;
}
