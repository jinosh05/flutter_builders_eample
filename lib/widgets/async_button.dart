import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

class AsyncButton extends StatefulWidget {
  const AsyncButton({
    required this.child,
    required this.onPressed,
    super.key,
    this.size,
  });
  final Widget child;
  final Function() onPressed;
  final double? size;
  @override
  State<AsyncButton> createState() => _AsyncButtonState();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<Function()>.has("onPressed", onPressed))
      ..add(DoubleProperty("size", size));
  }
}

class _AsyncButtonState extends State<AsyncButton> {
  final ValueNotifier<bool> _valueNotifier = ValueNotifier<bool>(false);

  Future<void> _onTap() async {
    _valueNotifier.value = true;
    await widget.onPressed();
    _valueNotifier.value = false;
  }

  @override
  Widget build(final BuildContext context) => ValueListenableBuilder<bool>(
        valueListenable: _valueNotifier,
        builder: (
          final BuildContext context,
          final bool value,
          final Widget? child,
        ) =>
            InkWell(
          onTap: value ? () {} : _onTap,
          child: value ? const CircularProgressIndicator() : widget.child,
        ),
      );
}
