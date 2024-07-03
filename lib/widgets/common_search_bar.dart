import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

class CommonSearchBar extends StatelessWidget {
  const CommonSearchBar({
    required this.controller,
    required this.onClear,
    super.key,
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
