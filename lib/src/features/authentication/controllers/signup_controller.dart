import 'dart:js_interop';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:imaginarium/src/features/authentication/model/user_model.dart';
import 'package:imaginarium/src/repository/user_repository.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final gender = TextEditingController();
  final age = TextEditingController();

  final userRepo = Get.put(UserRepository());

  void registerUser(String email, String password){
   /* String? error = AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password) as String?;
    if(error != null){
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }*/
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
  }

}