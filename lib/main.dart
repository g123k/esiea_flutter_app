import 'package:flutter/material.dart';
import 'package:untitled5/pages/product_page.dart';
import 'package:untitled5/res/app_colors.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.blue,
        ),
        textTheme: const TextTheme(
            titleMedium: TextStyle(
              color: AppColors.blue,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            displayMedium: TextStyle(
              color: AppColors.gray2,
              fontSize: 18.0,
            ),
            titleSmall: TextStyle()),
        useMaterial3: true,
      ),
      home: const ProductPage(),
    );
  }
}
