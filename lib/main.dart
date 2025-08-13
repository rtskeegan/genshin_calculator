import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:genshin_calculator/view/calculator_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MaterialApp(
    home: CalculatorView(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalculatorView(),
    );
  }
}
