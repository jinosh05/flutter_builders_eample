import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_builders_eample/builders/bloc_with_async/bloc/async_bloc.dart";
import "package:flutter_builders_eample/widgets/async_button.dart";

class BlocWithAsync extends StatefulWidget {
  const BlocWithAsync({super.key});

  @override
  State<BlocWithAsync> createState() => _BlocWithAsyncState();
}

class _BlocWithAsyncState extends State<BlocWithAsync> {
  ValueNotifier<int> randNotifier = ValueNotifier<int>(0);
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
                    "Random Number is : ${state.number}",
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
          ValueListenableBuilder<int>(
            valueListenable: randNotifier,
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
              randNotifier.value = await bloc.getRandomNumber();
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

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<ValueNotifier<int>>("randNotifier", randNotifier),
    );
  }
}
