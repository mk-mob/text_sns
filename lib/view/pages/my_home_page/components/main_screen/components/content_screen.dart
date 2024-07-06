import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/controllers/main_controller.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final authController = AuthController.to;
    const style = TextStyle(fontSize: 20.0);
    return Column(
      children: [
        Obx(() {
          var uid = MainController.to.rxPublicUser.value?.uid ?? "Nullです";
          var name = MainController.to.rxPublicUser.value?.name ?? "未登録です";
          return Text(
            "ユーザーID： $uid \n\n ネーム: $name",
            style: style,
          );
        }),
        const SizedBox(
          height: 20.0,
        ),
        ElevatedButton(
            onPressed: authController.onSignOutButtonPressed,
            child: const Text(
              "ログアウトする",
              style: style,
            )),
      ],
    );
  }
}
