import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_builders_eample/builders/universal_bloc/bloc/universal_bloc.dart";

class UniversalBlocScreen extends StatelessWidget {
  const UniversalBlocScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final UniversalBloc bloc = context.read<UniversalBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Universal Bloc Screen",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: BlocBuilder<UniversalBloc, UniversalState>(
              bloc: bloc,
              builder:
                  (final BuildContext context, final UniversalState state) {
                if (state is UniversalValueState) {
                  return Text(
                    "Value is ${state.value}",
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
              bloc.add(UniversalIncremetEvent());
            },
            child: Text(
              "Increment",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.blue),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              unawaited(
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (final BuildContext context) =>
                        const UniversalBlocScreen(),
                  ),
                ),
              );
            },
            child: Text(
              "New Screen",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.yellow),
            ),
          ),
        ],
      ),
    );
  }
}
