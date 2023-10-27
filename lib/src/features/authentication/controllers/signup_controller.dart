import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final gender = TextEditingController();
  final age = TextEditingController();

  void registerUser(String email, String password, String name, String gender, String age){

  }

}