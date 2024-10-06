import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tide/core/utils/colors.dart';
import 'package:tide/view/canvas/tide_canvas_page.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: TideColors.primaryColor),
        useMaterial3: true,
        scaffoldBackgroundColor: TideColors.scaffoldBg,
      ),
      home: TideCanvasPage(),
    );
  }
}
