import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_builders_eample/models/dictionary_model.dart";

class CommonListUI extends StatelessWidget {
  const CommonListUI({
    required this.list,
    super.key,
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
