import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_builders_eample/builders/cubit_with_vlb/cubit/cubit1_cubit.dart";
import "package:flutter_builders_eample/models/dictionary_model.dart";
import "package:flutter_builders_eample/widgets/common_list_ui.dart";
import "package:flutter_builders_eample/widgets/common_search_bar.dart";

class CubitWithVlb extends StatelessWidget {
  const CubitWithVlb({super.key});

  @override
  Widget build(final BuildContext context) {
    final Cubit1Cubit cubit = context.read<Cubit1Cubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ValueListenableBuilder with Cubit",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Column(
        children: <Widget>[
          CommonSearchBar(
            controller: cubit.controller,
            onClear: () {
              cubit.clearText();
            },
          ),
          ValueListenableBuilder<List<DictionaryData>>(
            valueListenable: cubit.listNotifier,
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
