import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_builders_eample/builders/bloc_build_when/bloc/build_when_bloc.dart";

class BlocBuildWhenScreen extends StatelessWidget {
  const BlocBuildWhenScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final BuildWhenBloc bloc = context.read<BuildWhenBloc>();
    final double w = MediaQuery.sizeOf(context).width / 100;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bloc Build When Screen",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: w * 5,
            ),
            child: Text(
              "The `buildWhen` function of `BlocBuilder` helps optimize performance by preventing unnecessary rebuilds, allowing the component to re-render only when specified conditions are met.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white60,
                  ),
            ),
          ),
          BlocBuilder<BuildWhenBloc, BuildWhenState>(
            buildWhen:
                (final BuildWhenState previous, final BuildWhenState current) {
              if (current is BuildWhenDefaultState) {
                return current.value.isEven;
              }
              return false;
            },
            builder: (final BuildContext context, final BuildWhenState state) {
              if (state is BuildWhenDefaultState) {
                return Text(
                  "Even Random Number is : ${state.value}",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.purple,
                      ),
                );
              }
              return const Text("");
            },
          ),
          ElevatedButton(
            onPressed: () {
              bloc.add(GenerateRandEvent());
            },
            child: Text(
              "Generate Random",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.blue),
            ),
          ),
          BlocBuilder<BuildWhenBloc, BuildWhenState>(
            buildWhen:
                (final BuildWhenState previous, final BuildWhenState current) {
              if (current is BuildWhenDefaultState) {
                return current.value.isOdd;
              }
              return false;
            },
            builder: (final BuildContext context, final BuildWhenState state) {
              if (state is BuildWhenDefaultState) {
                return Text(
                  "Odd Random Number is : ${state.value}",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.purple,
                      ),
                );
              }
              return const Text("");
            },
          ),
          const Text(""),
        ],
      ),
    );
  }
}
