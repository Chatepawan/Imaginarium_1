import 'dart:js_interop';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:imaginarium/src/constants/colors.dart';
import 'package:imaginarium/src/features/authentication/model/user_model.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db.collection("Users").add(user.toJson()).whenComplete(
            () => Get.snackbar("Success", "Your account has been created.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: primaryColor,
              colorText: whiteColor
              ),
            )
        .catchError((error, stackTree){
          Get.snackbar("Error", "Something went wrong, try again!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: primaryColor,
          colorText: whiteColor);
          print(error.toString());
    });

  }
}