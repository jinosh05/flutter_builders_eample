import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_builders_eample/builders/cubit_build_when/cubit/build_when_cubit.dart";

class CubitBuildWhenScreen extends StatelessWidget {
  const CubitBuildWhenScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final BuildWhenCubit cubit = context.read<BuildWhenCubit>();
    final double w = MediaQuery.sizeOf(context).width / 100;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cubit Build When Screen",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          BlocBuilder<BuildWhenCubit, BuildWhenState>(
            buildWhen: (
              final BuildWhenState previous,
              final BuildWhenState current,
            ) {
              if (current is BuildWhenCubitState) {
                return current.value.isEven;
              }
              return false;
            },
            builder: (final BuildContext context, final BuildWhenState state) {
              if (state is BuildWhenCubitState) {
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
            onPressed: cubit.generateRandNumber,
            child: Text(
              "Generate Random",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.blue),
            ),
          ),
          BlocBuilder<BuildWhenCubit, BuildWhenState>(
            buildWhen: (
              final BuildWhenState previous,
              final BuildWhenState current,
            ) {
              if (current is BuildWhenCubitState) {
                return current.value.isOdd;
              }
              return false;
            },
            builder: (final BuildContext context, final BuildWhenState state) {
              if (state is BuildWhenCubitState) {
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
