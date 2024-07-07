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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: BlocBuilder<AsyncBloc, AsyncState>(
              builder: (final BuildContext context, final AsyncState state) {
                if (state is AsyncInitial) {
                  bloc.add(GetRandomNumEvent());
                  return const CircularProgressIndicator();
                }
                if (state is AsyncLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is AsyncLoaded) {
                  return Text(
                    "Random Number is ${state.number}",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Colors.purple,
                        ),
                  );
                }
                return const Text("");
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              bloc.add(GetRandomNumEvent());
            },
            child: Text(
              "Generate Random",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
