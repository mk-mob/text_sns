import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:text_sns/constant/my_homepage_constant.dart';
import 'package:text_sns/core/firestore/doc_ref_core.dart';
import 'package:text_sns/models/public_user/public_user.dart';
import 'package:text_sns/repository/firestore_repository.dart';
import 'package:text_sns/typedefs/firestore_typedef.dart';
import 'package:text_sns/ui_core/ui_helper.dart';

class MyHomePageController extends GetxController {
  final rxDoc = Rx<Doc?>(null);

  void onFloatingActionButtonPressed() async {
    await _createDoc();
  }

  Future<void> _createDoc() async {
    final repository = FirestoreRepository();
    const user = PublicUser(uid: "obx");
    // final ref = FirebaseFirestore.instance.collection('users').doc(user.uid);
    final ref = DocRefCore.publicUserDocRef(user.uid);
    final data = user.toJson();
    final result = await repository.createDoc(ref, data);
    result.when(success: (_) async {
      await _readDoc(ref);
    }, failure: () {
      debugPrint(MyHomePageConstant.createUserFailureMsg);
    });
  }

  Future<void> _readDoc(DocRef ref) async {
    final repository = FirestoreRepository();
    final result = await repository.getDoc(ref);
    result.when(success: (doc) {
      rxDoc.value = doc;
      UIHelper.showFlutterToast(
          "${MyHomePageConstant.readUserSuccessMsg}${ref.toString()}");
    }, failure: () {
      UIHelper.showFlutterToast(MyHomePageConstant.readUserFailureMsg);
    });
  }
}
