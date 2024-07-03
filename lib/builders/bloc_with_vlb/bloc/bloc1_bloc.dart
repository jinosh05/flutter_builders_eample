import "package:bloc/bloc.dart";
import "package:flutter/material.dart";
import "package:flutter_builders_eample/models/dictionary_model.dart";
import "package:flutter_builders_eample/service/api_services.dart";

part "bloc1_event.dart";
part "bloc1_state.dart";

class Bloc1Bloc extends Bloc<Bloc1Event, Bloc1State> {
  Bloc1Bloc() : super(Bloc1Initial()) {
    on<Bloc1Event>((final Bloc1Event event, final Emitter<Bloc1State> emit) {
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
      if (event is ClearTextEvent) {
        listNotifier.value = <DictionaryData>[];
      }
    });
  }

  final ValueNotifier<List<DictionaryData>> listNotifier =
      ValueNotifier<List<DictionaryData>>(<DictionaryData>[]);

  final TextEditingController controller = TextEditingController();
}
