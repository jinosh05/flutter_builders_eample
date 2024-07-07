import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_builders_eample/builders/bloc_with_async/bloc/async_bloc.dart";

class BlocWithAsync extends StatefulWidget {
  const BlocWithAsync({super.key});

  @override
  State<BlocWithAsync> createState() => _BlocWithAsyncState();
}

class _BlocWithAsyncState extends State<BlocWithAsync> {
  @override
  Widget build(final BuildContext context) {
    final AsyncBloc bloc = context.read<AsyncBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bloc With Async Screen",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: const Column(),
    );
  }
}
