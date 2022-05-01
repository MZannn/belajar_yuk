import 'package:nabung_yuk/controller/text_controller.dart';
import 'package:nabung_yuk/screen/login/login_screen.dart';
import 'package:nabung_yuk/screen/nabung/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AkunScreen extends StatelessWidget {
  const AkunScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(TextController());
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
                  Get.offAll(()=>const LoginScreen());
                }, child: const Text('Logout',style: TextStyle(color: Colors.redAccent)),)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: ctrl.name,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 0, style: BorderStyle.none),
                ),
                hintText: 'Nama',
                labelText:'Nama',
                enabled: false,
              ),
            ),
            TextFormField(
              controller: ctrl.email,
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
            TextFormField(
              controller: ctrl.password,
              obscureText: true,
              decoration: InputDecoration(
                fillColor: Colors.redAccent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 0, style: BorderStyle.none),
                ),
                hintText: 'Password',
                labelText: 'Password',
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
