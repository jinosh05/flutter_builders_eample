import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_builders_eample/builders/bloc_build_when/bloc/build_when_bloc.dart";
import "package:flutter_builders_eample/builders/bloc_build_when/bloc_build_when_screen.dart";
import "package:flutter_builders_eample/builders/bloc_with_async/bloc/async_bloc.dart";
import "package:flutter_builders_eample/builders/bloc_with_async/bloc_with_async.dart";
import "package:flutter_builders_eample/builders/bloc_with_vlb/bloc/vlb_bloc.dart";
import "package:flutter_builders_eample/builders/bloc_with_vlb/bloc_with_vlb.dart";
import "package:flutter_builders_eample/builders/builders.dart";
import "package:flutter_builders_eample/builders/cubit_build_when/cubit/build_when_cubit.dart";
import "package:flutter_builders_eample/builders/cubit_build_when/cubit_build_when_screen.dart";
import "package:flutter_builders_eample/builders/cubit_builders/cubit/cubit_base_cubit.dart";
import "package:flutter_builders_eample/builders/cubit_builders/cubit_builders.dart";
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
        BlocProvider<VLBBloc>(
          create: (final BuildContext context) => VLBBloc(),
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
        BlocProvider<CubitBaseCubit>(
          create: (final BuildContext context) => CubitBaseCubit(),
        ),
        BlocProvider<BuildWhenBloc>(
          create: (final BuildContext context) => BuildWhenBloc(),
        ),
        BlocProvider<BuildWhenCubit>(
          create: (final BuildContext context) => BuildWhenCubit(),
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
            return const CubitBuildWhenScreen();
            // ignore: dead_code
            return const BlocWithVlb();
            return const CubitWithVlb();
            return const CubitBuildersEg();
            return const BuildersPage();
            return const UniversalBlocScreen();
            return const BlocWithAsync();
            return const ServiceWithVlb();
            return const VLBuildersPage();
            return const BlocBuildWhenScreen();
            return HomePage();
            return BlocProvider<PageMemoryBloc>(
              create: (final BuildContext context) => PageMemoryBloc(),
              child: const PageMemoryScreen(),
            );
          },
        ),
      );
}
