import "package:bloc/bloc.dart";
import "package:flutter/material.dart";
import "package:flutter_builders_eample/models/dictionary_model.dart";
import "package:flutter_builders_eample/service/api_services.dart";

part "vlb_event.dart";
part "vlb_state.dart";

class VLBBloc extends Bloc<VLBEvent, VLBState> {
  VLBBloc() : super(VLBInitial()) {
    on<VLBEvent>((final VLBEvent event, final Emitter<VLBState> emit) {
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
      if (event is ClearTextVLBEvent) {
        listNotifier.value = <DictionaryData>[];
      }
    });
  }

  final ValueNotifier<List<DictionaryData>> listNotifier =
      ValueNotifier<List<DictionaryData>>(<DictionaryData>[]);

  final TextEditingController controller = TextEditingController();
}
