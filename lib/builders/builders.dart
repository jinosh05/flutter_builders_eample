import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

class BuildersPage extends StatefulWidget {
  const BuildersPage({super.key});

  @override
  State<BuildersPage> createState() => _BuildersPageState();
}

class _BuildersPageState extends State<BuildersPage> {
  int incrementer = 0;
  bool enableSetstate = true;

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Builders with and Without SetState",
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
                "The Builder widget is a general-purpose widget that builds a widget tree inside the builder function.\n This is particularly useful when you need a new context with different inherited widgets.\nThe Widget will get Built only whwn setState method is called.",
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
                child: Builder(
                  builder: (final BuildContext context) {
                    ///  Can be used to perfoerm any Function
                    debugPrint("Rebuilding the Widget");
                    return Text(
                      "Value : $incrementer",
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
                    incrementer++;
                  });
                } else {
                  incrementer++;
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
      ..add(IntProperty("incrementer", incrementer))
      ..add(DiagnosticsProperty<bool>("enableSetstate", enableSetstate));
  }
}
