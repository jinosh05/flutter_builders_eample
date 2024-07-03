part of "../service_with_vlb.dart";

class _AppServices {
  static final ValueNotifier<List<DictionaryData>> listNotifier =
      ValueNotifier<List<DictionaryData>>(<DictionaryData>[]);

  static final TextEditingController controller = TextEditingController()
    ..addListener(
      () async {
        await ApiServices().fetchApi(controller.text).then(
          (final DictionaryModel? value) {
            if (value != null) {
              listNotifier.value = value.list;
            }
          },
        );
      },
    );

  void clearText() {
    listNotifier.value = <DictionaryData>[];
  }
}
