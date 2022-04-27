import 'package:flutter/Material.dart';
import 'package:get/get.dart';

class TextController extends GetxController{
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool ishidden = true.obs;
}
