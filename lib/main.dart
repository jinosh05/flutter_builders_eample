import "package:flutter/material.dart";
import "package:flutter_builders_eample/builders/builders.dart";
import "package:flutter_builders_eample/home_page.dart";

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: Builder(
        builder: (final BuildContext context) {
          return const BuildersPage();
          // ignore: dead_code
          return HomePage();
        },
      ),
    ),
  );
}
