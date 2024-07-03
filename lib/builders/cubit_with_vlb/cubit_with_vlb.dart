import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_builders_eample/builders/cubit_with_vlb/cubit/cubit1_cubit.dart";

class CubitWithVlb extends StatelessWidget {
  const CubitWithVlb({super.key});

  @override
  Widget build(final BuildContext context) {
    final Cubit1Cubit cubit = context.read<Cubit1Cubit>();
    return const Placeholder();
  }
}
