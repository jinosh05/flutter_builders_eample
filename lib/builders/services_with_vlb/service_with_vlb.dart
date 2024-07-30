import "package:flutter/material.dart";
import "package:flutter_builders_eample/models/dictionary_model.dart";
import "package:flutter_builders_eample/service/api_services.dart";
import "package:flutter_builders_eample/widgets/common_list_ui.dart";
import "package:flutter_builders_eample/widgets/common_search_bar.dart";

part "services/service.dart";

class ServiceWithVlb extends StatelessWidget {
  const ServiceWithVlb({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            "ValueListenableBuilder with Service",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: Column(
          children: <Widget>[
            CommonSearchBar(
              controller: _AppServices.controller,
              onClear: () {
                _AppServices().clearText();
              },
            ),
            ValueListenableBuilder<List<DictionaryData>>(
              valueListenable: _AppServices.listNotifier,
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
