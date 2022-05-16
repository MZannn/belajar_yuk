import 'package:nabung_yuk/controller/auth_controller.dart';
import 'package:nabung_yuk/controller/login_controller.dart';
import 'package:nabung_yuk/screen/nabung/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AkunScreen extends StatelessWidget {
  const AkunScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginC = Get.find<LoginController>();
    final authC = Get.find<AuthController>();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Profile',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                TextButton(onPressed: (){
                  authC.logOut();
                  loginC.email.clear();
                  loginC.password.clear();
                }, child: const Text('Logout',style: TextStyle(color: Colors.redAccent)),)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: loginC.email,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 0, style: BorderStyle.none),
                ),
                hintText: 'Email',
                labelText: 'Email',
                enabled: false,
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Get.to(()=>const ChangePassword());
                  },
                  child: const Text(
                'Ganti Password',
                style: TextStyle(color: Colors.redAccent),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
