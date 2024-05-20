import 'package:flutter/material.dart';
import 'package:review_native_state_management/app/pages/bloc_pattern_page/bloc_pattern_page.dart';
import 'package:review_native_state_management/app/pages/change_notifier_page/change_notifier_page.dart';
import 'package:review_native_state_management/app/pages/home/home_page.dart';
import 'package:review_native_state_management/app/pages/set_state_page/set_state_page.dart';
import 'package:review_native_state_management/app/pages/value_notifier_page/value_notifier_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Native State Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            
          ),
        ),
        useMaterial3: true,
      ),
      routes: {
        "/": (_) => const HomePage(),
        "/set-state": (_) => const SetStatePage(),
        "/value-notifier": (_) => const ValueNotifierPage(),
        "/change-notifier": (_) => const ChangeNotifierPage(),
        "/bloc-pattern": (_) => const BlocPatternPage(),
      },
    );
  }
}