import 'package:bitmango/src/HomePage/homepage_bindings.dart';
import 'package:bitmango/src/HomePage/homepage_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String initialRoute = "/initialRoute";
  static List<GetPage> pages = [
    GetPage(
        name: initialRoute,
        page: () => const HomePageScreen(),
        binding: HomepageBindings())
  ];
}
