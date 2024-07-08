import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_builders_eample/builders/cubit_builders/cubit/cubit_base_cubit.dart";
import "package:flutter_builders_eample/widgets/async_button.dart";

class CubitBuildersEg extends StatelessWidget {
  const CubitBuildersEg({super.key});

  @override
  Widget build(final BuildContext context) {
    final CubitBaseCubit cubit = context.read<CubitBaseCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cubit Builders Screen",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: BlocBuilder<CubitBaseCubit, CubitBaseState>(
              builder:
                  (final BuildContext context, final CubitBaseState state) {
                if (state is CubitBaseInitial) {
                  unawaited(cubit.getNumberAndEmit());
                  return const CircularProgressIndicator();
                }
                if (state is CubitBaseLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is CubitBaseLoaded) {
                  return Text(
                    "Random Number is : ${state.value}",
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
              unawaited(cubit.getNumberAndEmit());
            },
            child: Text(
              "Generate Random",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.blue),
            ),
          ),

          /// Cubit with [ValueListenableBuilder]
          ValueListenableBuilder<int>(
            valueListenable: cubit.randNotifier,
            builder: (
              final BuildContext context,
              final int value,
              final Widget? child,
            ) =>
                Text(
              "Random Number from Async : $value",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.purple,
                  ),
            ),
          ),
          AsyncButton(
            onPressed: () async {
              cubit.randNotifier.value = await cubit.getRandomNumber();
            },
            child: Text(
              "VLB Generate",
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
