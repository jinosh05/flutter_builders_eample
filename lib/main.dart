import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_builders_eample/builders/bloc_build_when/bloc/build_when_bloc.dart";
import "package:flutter_builders_eample/builders/bloc_with_async/bloc/async_bloc.dart";
import "package:flutter_builders_eample/builders/bloc_with_vlb/bloc/vlb_bloc.dart";
import "package:flutter_builders_eample/builders/cubit_build_when/cubit/build_when_cubit.dart";
import "package:flutter_builders_eample/builders/cubit_builders/cubit/cubit_base_cubit.dart";
import "package:flutter_builders_eample/builders/cubit_with_vlb/cubit/cubit1_cubit.dart";
import "package:flutter_builders_eample/builders/universal_bloc/bloc/universal_bloc.dart";
import "package:flutter_builders_eample/home_page.dart";
import "package:nested/nested.dart";

void main() {
  runApp(
    const BaseApp(),
  );
}

class BaseApp extends StatelessWidget {
  const BaseApp({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => MultiBlocProvider(
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
      );
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
}
