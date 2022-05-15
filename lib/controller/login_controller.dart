import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  TextEditingController email = TextEditingController();
  final password = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    email = TextEditingController(text: FirebaseAuth.instance.currentUser?.email);
  }
  var ishidden = true.obs;


  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}