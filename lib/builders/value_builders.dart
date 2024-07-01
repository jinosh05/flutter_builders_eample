import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

class VLBuildersPage extends StatefulWidget {
  const VLBuildersPage({super.key});

  @override
  State<VLBuildersPage> createState() => _VLBuildersPageState();
}

class _VLBuildersPageState extends State<VLBuildersPage> {
  bool enableSetstate = true;
  ValueNotifier<int> incrementNotifier = ValueNotifier<int>(0);

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            "ValueListenableBuilder",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                // ignore: lines_longer_than_80_chars
                "The ValueListenableBuilder is a widget that listens to a ValueListenable and rebuilds when the value changes. There is no need for setState at all",
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Card(
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ValueListenableBuilder<int>(
                  valueListenable: incrementNotifier,
                  builder: (
                    final BuildContext context,
                    final int value,
                    final Widget? child,
                  ) {
                    ///  Can be used to perfoerm any Function
                    debugPrint("Rebuilding the Widget");
                    return Text(
                      "Value : $value",
                      style: const TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (enableSetstate) {
                  setState(() {
                    incrementNotifier.value++;
                  });
                } else {
                  incrementNotifier.value++;
                }
              },
              child: const Text(
                "Increment Value",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  enableSetstate ? "Disable setState  " : "Enable setState  ",
                ),
                Switch(
                  value: enableSetstate,
                  onChanged: (final bool? value) {
                    if (value != null) {
                      setState(() {
                        enableSetstate = value;
                      });
                    }
                  },
                ),
              ],
            ),
            const SizedBox(),
          ],
        ),
      );

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>("enableSetstate", enableSetstate))
      ..add(
        DiagnosticsProperty<ValueNotifier<int>>(
          "incrementNotifier",
          incrementNotifier,
        ),
      );
  }
}
