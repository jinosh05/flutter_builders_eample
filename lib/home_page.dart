import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> topics = <String>[
    "Builder",
    "Value Listenable Builder",
    "Value Listenable Builder with Bloc / Cubit",
    "Value Listenable Builder with Services",
    "Bloc Builders Universal memory",
    "Bloc Builders Page Memory",
    "Bloc Builders with Async Function",
    "Bloc Builders with Value Listenable Builders",
    "Cubit and Bloc Builders",
    "Cubit and Value Listenable Builders",
  ];

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Builders in Flutter with Use Cases",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        body: ListView.builder(
          itemCount: topics.length,
          itemBuilder: (final BuildContext context, final int index) =>
              ListTile(
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 22,
            ),
            title: Text(
              topics[index],
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: index.isEven ? Colors.purple : Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
      );
  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<String>("topics", topics));
  }
}
