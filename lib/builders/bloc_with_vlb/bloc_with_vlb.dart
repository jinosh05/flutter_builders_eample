import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_builders_eample/builders/bloc_with_vlb/bloc/bloc1_bloc.dart";
import "package:flutter_builders_eample/models/dictionary_model.dart";
import "package:flutter_builders_eample/widgets/common_list_ui.dart";
import "package:flutter_builders_eample/widgets/common_search_bar.dart";

class BlocWithVlb extends StatelessWidget {
  const BlocWithVlb({super.key});

  @override
  Widget build(final BuildContext context) {
    final Bloc1Bloc bloc = context.read<Bloc1Bloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ValueListenableBuilder with Bloc/Cubit",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Column(
        children: <Widget>[
          CommonSearchBar(
            controller: bloc.controller,
            onClear: () {
              bloc.add(ClearTextEvent());
            },
          ),
          ValueListenableBuilder<List<DictionaryData>>(
            valueListenable: bloc.listNotifier,
            builder: (
              final BuildContext context,
              final List<DictionaryData> value,
              final Widget? child,
            ) =>
                CommonListUI(list: value),
          ),
        ],
      ),
    );
  }
}
