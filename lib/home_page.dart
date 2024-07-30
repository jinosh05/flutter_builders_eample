import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_builders_eample/builders/bloc_build_when/bloc_build_when_screen.dart";
import "package:flutter_builders_eample/builders/bloc_with_async/bloc_with_async.dart";
import "package:flutter_builders_eample/builders/bloc_with_vlb/bloc_with_vlb.dart";
import "package:flutter_builders_eample/builders/builders.dart";
import "package:flutter_builders_eample/builders/cubit_build_when/cubit_build_when_screen.dart";
import "package:flutter_builders_eample/builders/cubit_with_vlb/cubit_with_vlb.dart";
import "package:flutter_builders_eample/builders/page_memory_bloc/bloc/page_memory_bloc.dart";
import "package:flutter_builders_eample/builders/page_memory_bloc/page_memory_bloc_screen.dart";
import "package:flutter_builders_eample/builders/services_with_vlb/service_with_vlb.dart";
import "package:flutter_builders_eample/builders/universal_bloc/universal_bloc_screen.dart";
import "package:flutter_builders_eample/builders/value_builders.dart";

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> topics = <String>[
    "Builder",
    "Value Listenable Builder",
    "Value Listenable Builder with Bloc",
    "Value Listenable Builder with Cubit",
    "Value Listenable Builder with Services",
    "Bloc Builders Universal memory",
    "Bloc Builders Page Memory",
    "Bloc Builders with Async Function",
    "Cubit Builders Build When",
    "Bloc Builders Build When",
  ];

  final List<Widget> pages = <Widget>[
    const BuildersPage(),
    const VLBuildersPage(),
    const BlocWithVlb(),
    const CubitWithVlb(),
    const ServiceWithVlb(),
    const UniversalBlocScreen(),
    BlocProvider<PageMemoryBloc>(
      create: (final BuildContext context) => PageMemoryBloc(),
      child: const PageMemoryScreen(),
    ),
    const BlocWithAsync(),
    const CubitBuildWhenScreen(),
    const BlocBuildWhenScreen(),
  ];

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Builders in Flutter with Use Cases",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: ListView.builder(
          itemCount: topics.length,
          itemBuilder: (final BuildContext context, final int index) =>
              ListTile(
            onTap: () async {
              await push(context, pages[index]);
            },
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
    properties
      ..add(IterableProperty<String>("topics", topics))
      ..add(IterableProperty<Widget>("pages", pages));
  }

  static Future<void> push(
    final BuildContext context,
    final Widget page,
  ) async {
    await Navigator.of(context).push(
      MaterialPageRoute<Widget>(builder: (final BuildContext context) => page),
    );
  }
}
