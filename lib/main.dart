import 'package:arz3/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Api',
      home: HomePage(),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 26, 32, 39),
        primaryColor: const Color.fromARGB(255, 125, 169, 217),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 32, 44, 57),
          foregroundColor: Colors.white,
        ),
      ),
      themeMode: ThemeMode.system, //برای تم پیش فرض گوشیه
    );
  }
}
