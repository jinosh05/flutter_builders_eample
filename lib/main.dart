import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_builders_eample/builders/bloc_with_vlb/bloc/bloc1_bloc.dart";
import "package:flutter_builders_eample/builders/bloc_with_vlb/bloc_with_vlb.dart";
import "package:flutter_builders_eample/builders/builders.dart";
import "package:flutter_builders_eample/builders/value_builders.dart";
import "package:flutter_builders_eample/home_page.dart";
import "package:nested/nested.dart";

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: MultiBlocProvider(
        providers: <SingleChildWidget>[
          BlocProvider<Bloc1Bloc>(
            create: (final BuildContext context) => Bloc1Bloc(),
          ),
        ],
        child: Builder(
          builder: (final BuildContext context) {
            return const BlocWithVlb();
            // ignore: dead_code
            return const BuildersPage();
            return const VLBuildersPage();
            return HomePage();
          },
        ),
      ),
    ),
  );
}
