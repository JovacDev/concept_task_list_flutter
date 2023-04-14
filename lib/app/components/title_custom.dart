import 'package:flutter/material.dart';

class TitleCustom extends StatelessWidget {
  const TitleCustom({Key? key, required this.title, this.color})
      : super(key: key);

  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontSize: 18, fontWeight: FontWeight.w600, color: color),
    );
  }
}
