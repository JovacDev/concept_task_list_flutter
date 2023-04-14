import 'package:flutter/material.dart';
import 'package:task_list/app/view/home_page/inherited_widgets.dart';
import 'package:task_list/app/view/task_list_page/task_list_page.dart';

import 'app/view/home_page/state_page.dart';
import 'app/view/splash_page/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF40B7AD);
    const textColor = Color(0xFF4A4A4A);
    const backgroundColor = Color(0xFFF5F5F5);
    return SpecialColor(
      color: Colors.redAccent,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          scaffoldBackgroundColor: backgroundColor,
          textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'Poppins',
                bodyColor: textColor,
                displayColor: textColor,
              ),
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: Colors.transparent),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 54),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w700)),
          ),
        ),
        home: const SplashPage(),
      ),
    );
  }
}
