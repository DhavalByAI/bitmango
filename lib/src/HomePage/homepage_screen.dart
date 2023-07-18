import 'package:bitmango/src/HomePage/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  HomePageController _ = Get.find();
  @override
  void initState() {
    _.controller.enableZoom(false);
    // Future.delayed(const Duration(seconds: 1), () {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          if (await _.controller.canGoBack()) {
            _.controller.goBack();
            return false;
          } else {
            debugPrint('No history available');
            return true;
          }
        },
        child: Scaffold(
          body: GetBuilder<HomePageController>(
            initState: (_) {},
            builder: (_) {
              _.controller.runJavaScript(
                  "document.querySelector('.download-icon').style.display = 'none';");
              return (_.isLoading || _.isError)
                  ? Container(
                      color: Colors.blueGrey,
                      height: double.maxFinite,
                      width: double.maxFinite,
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/bg.png",
                            height: double.maxFinite,
                            width: double.maxFinite,
                            fit: BoxFit.cover,
                          ),
                          Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  "assets/logo.png",
                                  fit: BoxFit.cover,
                                  height: 70,
                                  width: 170,
                                ),
                                const SizedBox(
                                  height: 80,
                                ),
                                const CircularProgressIndicator(
                                  color: Colors.blueGrey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : WebViewWidget(controller: _.controller);
            },
          ),
        ),
      ),
    );
  }
}
