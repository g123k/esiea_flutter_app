import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled5/pages/home_page.dart';
import 'package:untitled5/pages/product_page.dart';
import 'package:untitled5/res/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const Homepage(),
      routes: [
        GoRoute(
          path: '/product',
          builder: (BuildContext context, GoRouterState state) =>
              const ProductPage(),
        ),
      ],
    ),
  ]);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: AppColors.blue,
          outlineVariant: AppColors.gray2,
        ),
        primaryColor: AppColors.blue,
        primaryColorLight: AppColors.blueLight,
        primaryColorDark: AppColors.blueDark,
        fontFamily: 'Avenir',
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          backgroundColor: AppColors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: AppColors.blue,
          ),
          titleTextStyle: TextStyle(
            color: AppColors.blue,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: AppColors.blue,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: TextStyle(
            color: AppColors.gray2,
            fontSize: 18.0,
          ),
          headlineMedium: TextStyle(
            color: AppColors.gray3,
            fontSize: 17.0,
          ),
          headlineSmall: TextStyle(
            color: AppColors.blue,
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        dividerColor: AppColors.gray2,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.blue,
          unselectedItemColor: AppColors.gray2,
          type: BottomNavigationBarType.fixed,
        ),
        navigationBarTheme: const NavigationBarThemeData(
          indicatorColor: AppColors.blue,
        ),
      ),
      routerConfig: _router,
    );
  }
}
