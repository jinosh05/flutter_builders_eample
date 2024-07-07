part of "async_bloc.dart";

@immutable
sealed class AsyncState {}

final class AsyncInitial extends AsyncState {}

final class AsyncLoading extends AsyncState {}

final class AsyncLoaded extends AsyncState {
  AsyncLoaded(this.number);
  final int number;
}
