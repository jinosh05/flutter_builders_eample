import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_builders_eample/builders/bloc_with_async/bloc/async_bloc.dart";
import "package:flutter_builders_eample/builders/bloc_with_async/bloc_with_async.dart";
import "package:flutter_builders_eample/builders/bloc_with_vlb/bloc/bloc1_bloc.dart";
import "package:flutter_builders_eample/builders/bloc_with_vlb/bloc_with_vlb.dart";
import "package:flutter_builders_eample/builders/builders.dart";
import "package:flutter_builders_eample/builders/cubit_with_vlb/cubit/cubit1_cubit.dart";
import "package:flutter_builders_eample/builders/cubit_with_vlb/cubit_with_vlb.dart";
import "package:flutter_builders_eample/builders/page_memory_bloc/bloc/page_memory_bloc.dart";
import "package:flutter_builders_eample/builders/page_memory_bloc/page_memory_bloc_screen.dart";
import "package:flutter_builders_eample/builders/services_with_vlb/service_with_vlb.dart";
import "package:flutter_builders_eample/builders/universal_bloc/bloc/universal_bloc.dart";
import "package:flutter_builders_eample/builders/universal_bloc/universal_bloc_screen.dart";
import "package:flutter_builders_eample/builders/value_builders.dart";
import "package:flutter_builders_eample/home_page.dart";
import "package:nested/nested.dart";

void main() {
  runApp(
    MultiBlocProvider(
      providers: <SingleChildWidget>[
        BlocProvider<Bloc1Bloc>(
          create: (final BuildContext context) => Bloc1Bloc(),
        ),
        BlocProvider<Cubit1Cubit>(
          create: (final BuildContext context) => Cubit1Cubit(),
        ),
        BlocProvider<UniversalBloc>(
          create: (final BuildContext context) => UniversalBloc(),
        ),
        BlocProvider<AsyncBloc>(
          create: (final BuildContext context) => AsyncBloc(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => MaterialApp(
        theme: ThemeData.dark(),
        home: Builder(
          builder: (final BuildContext context) {
            return const BlocWithAsync();
            // ignore: dead_code
            return const BlocWithVlb();
            return const CubitWithVlb();
            return const BuildersPage();
            return const UniversalBlocScreen();
            return const ServiceWithVlb();
            return const VLBuildersPage();
            return HomePage();
            return BlocProvider<PageMemoryBloc>(
              create: (final BuildContext context) => PageMemoryBloc(),
              child: const PageMemoryScreen(),
            );
          },
        ),
      );
}
