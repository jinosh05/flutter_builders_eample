import "package:bloc/bloc.dart";
import "package:flutter/material.dart";
import "package:flutter_builders_eample/models/dictionary_model.dart";
import "package:flutter_builders_eample/service/api_services.dart";

part "cubit1_state.dart";

class Cubit1Cubit extends Cubit<Cubit1State> {
  Cubit1Cubit() : super(Cubit1Initial()) {
    controller.addListener(
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
  }

  final ValueNotifier<List<DictionaryData>> listNotifier =
      ValueNotifier<List<DictionaryData>>(<DictionaryData>[]);

  final TextEditingController controller = TextEditingController();
}
