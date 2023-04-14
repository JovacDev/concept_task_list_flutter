import 'package:flutter/material.dart';

class Shape extends StatelessWidget {
  const Shape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/shape.png',
      width: 141,
      height: 129,
    );
  }
}
