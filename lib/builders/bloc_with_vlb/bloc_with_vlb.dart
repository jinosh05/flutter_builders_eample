import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_builders_eample/builders/bloc_with_vlb/bloc/bloc1_bloc.dart";
import "package:flutter_builders_eample/models/dictionary_model.dart";

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
          _SearchBar(
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
                _ResultUI(list: value),
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    required this.controller,
    required this.onClear,
  });
  final TextEditingController controller;
  final Function() onClear;
  @override
  Widget build(final BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              onPressed: () {
                controller.clear();
                onClear();
              },
              icon: const Icon(
                Icons.clear,
                size: 25,
              ),
            ),
          ),
        ),
      );
  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<TextEditingController>("controller", controller),
      )
      ..add(ObjectFlagProperty<Function()>.has("onClear", onClear));
  }
}

class _ResultUI extends StatelessWidget {
  const _ResultUI({
    required this.list,
  });
  final List<DictionaryData> list;

  @override
  Widget build(final BuildContext context) => Expanded(
        child: ListView.separated(
          itemCount: list.length,
          itemBuilder: (final BuildContext context, final int index) =>
              _DictionaryItem(
            index: index,
            data: list[index],
          ),
          separatorBuilder: (final BuildContext context, final int index) =>
              const SizedBox(
            height: 10,
          ),
        ),
      );
  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<DictionaryData>("list", list));
  }
}

class _DictionaryItem extends StatelessWidget {
  const _DictionaryItem({required this.index, required this.data});
  final int index;
  final DictionaryData data;

  @override
  Widget build(final BuildContext context) => Container(
        color: index.isEven ? Colors.white12 : Colors.blueGrey,
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.20,
              child: Text(
                data.word ?? "",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.70,
              child: Text(
                data.definition ?? "",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      );
  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty("index", index))
      ..add(DiagnosticsProperty<DictionaryData>("data", data));
  }
}
