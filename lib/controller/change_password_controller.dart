import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();

  RxBool isHiddenNewPassword = true.obs;
  RxBool isHiddenConfirmPassword = true.obs;


  @override
  void onClose() {
    newPassword.dispose();
    confirmPassword.dispose();
    super.onClose();
  }
}