import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{
  final email = TextEditingController();
  final password = TextEditingController();
  var ishidden = true.obs;
  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}