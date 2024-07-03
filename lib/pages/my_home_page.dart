// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:text_sns/models/public_usser.dart';
import '../flavors.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            final firstUserDocument = await FirebaseFirestore.instance
                .collection('public_users')
                .doc("first")
                .get();
            final firstUserJson = firstUserDocument.data();
            if (firstUserJson == null) {
              print("ユーザーが存在しません");
              return;
            } else {
              final publicUser = PublicUser.fromJson(firstUserJson);
              print("ユーザーのID: ${publicUser.uid}"); // first
            }
          } catch (e) {
            print("アクセスが拒否されました");
          }
        },
      ),
      body: Center(
        child: Text(
          'Hello ${F.title}',
        ),
      ),
    );
  }
}