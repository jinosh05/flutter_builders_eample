import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_builders_eample/builders/page_memory_bloc/bloc/page_memory_bloc.dart";

class PageMemoryScreen extends StatelessWidget {
  const PageMemoryScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final PageMemoryBloc bloc = context.read<PageMemoryBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Page Memory Bloc Screen",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: BlocBuilder<PageMemoryBloc, PageMemoryState>(
              bloc: bloc,
              builder:
                  (final BuildContext context, final PageMemoryState state) {
                if (state is PageMemoryValueState) {
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
              bloc.add(PageMemoryIncremnetEvent());
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
                    builder: (final BuildContext context) => BlocProvider(
                      create: (final BuildContext context) => PageMemoryBloc(),
                      child: const PageMemoryScreen(),
                    ),
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
