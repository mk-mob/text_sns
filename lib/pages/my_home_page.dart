import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controller/my_homepage_controller.dart';

import '../flavors.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyHomePageController());
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: controller.onFloatingActionButtonPressed),
      body: Center(
        child: Text(
          'Hello ${F.title}',
        ),
      ),
    );
  }
}
