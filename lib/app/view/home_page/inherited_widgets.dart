import 'package:flutter/material.dart';

class SpecialColor extends InheritedWidget {
  const SpecialColor({
    Key? key,
    required this.color,
    required Widget child,
  }) : super(key: key, child: child);

  final Color color;

  static SpecialColor of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<SpecialColor>();
    return result ?? (throw Exception('Special Color not found'));
  }

  @override
  bool updateShouldNotify(SpecialColor oldWidget) {
    return oldWidget.color != color;
  }
}
