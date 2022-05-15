import 'package:nabung_yuk/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabung_yuk/controller/change_password_controller.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final authC = Get.find<AuthController>();
    final changePC = Get.find<ChangePasswordController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ganti Password'),
        backgroundColor: Colors.redAccent,
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Obx(() => TextFormField(
                      controller: changePC.newPassword,
                      obscureText: changePC.isHiddenNewPassword.value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            changePC.isHiddenNewPassword.toggle();
                          },
                          child: changePC.isHiddenNewPassword.value == false
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Obx(() => TextFormField(
                      controller: changePC.confirmPassword,
                      obscureText: changePC.isHiddenConfirmPassword.value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Confirm Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            changePC.isHiddenConfirmPassword.toggle();
                          },
                          child: changePC.isHiddenConfirmPassword.value == false
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.redAccent),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (changePC.newPassword.text ==
                          changePC.confirmPassword.text) {
                        authC.changePassword(changePC.confirmPassword.text);
                        changePC.newPassword.clear();
                        changePC.confirmPassword.clear();
                      } else {
                        Get.defaultDialog(
                          title: "Kesalahan",
                          middleText:
                              "Password dan Confirm Password Harus Sama",
                          onConfirm: () {
                            Get.back();
                          },
                          textConfirm: "Ya",
                          buttonColor: Colors.redAccent,
                          confirmTextColor: Colors.white,
                        );
                      }
                    }
                  },
                  child: const Text('Ganti Password'),
                )
              ],
            ),
          )),
    );
  }
}
