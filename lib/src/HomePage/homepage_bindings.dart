import 'package:bitmango/src/HomePage/homepage_controller.dart';
import 'package:get/get.dart';

class HomepageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
}
