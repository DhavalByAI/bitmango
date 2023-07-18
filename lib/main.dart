import 'package:bitmango/app_routes.dart';
import 'package:bitmango/src/HomePage/homepage_bindings.dart';
import 'package:bitmango/src/HomePage/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bit Mango',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.initialRoute,
      initialBinding: HomepageBindings(),
      home: const HomePageScreen(),
    );
  }
}
