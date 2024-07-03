import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_builders_eample/builders/bloc_with_vlb/bloc/bloc1_bloc.dart";
import "package:flutter_builders_eample/builders/bloc_with_vlb/bloc_with_vlb.dart";
import "package:flutter_builders_eample/builders/builders.dart";
import "package:flutter_builders_eample/builders/cubit_with_vlb/cubit/cubit1_cubit.dart";
import "package:flutter_builders_eample/builders/cubit_with_vlb/cubit_with_vlb.dart";
import "package:flutter_builders_eample/builders/services_with_vlb/service_with_vlb.dart";
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
          BlocProvider<Cubit1Cubit>(
            create: (final BuildContext context) => Cubit1Cubit(),
          ),
        ],
        child: Builder(
          builder: (final BuildContext context) {
            return const ServiceWithVlb();
            // ignore: dead_code
            return const BlocWithVlb();
            return const CubitWithVlb();
            return const BuildersPage();
            return const VLBuildersPage();
            return HomePage();
          },
        ),
      ),
    ),
  );
}
