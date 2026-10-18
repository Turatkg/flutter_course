import 'package:flutter/material.dart';

import 'home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Course 2',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff2563eb),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xfff8fafc),
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
      ),
      home: HomePage(),
    );
  }
}
