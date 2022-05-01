import 'package:nabung_yuk/controller/text_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final ctrl = Get.put(TextController());
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
                      controller: ctrl.password,
                      obscureText: ctrl.ishidden.value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            ctrl.ishidden.toggle();
                          },
                          child: ctrl.ishidden.value == false
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Obx(() => TextFormField(
                      controller: ctrl.password,
                      obscureText: ctrl.ishidden.value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Confirm Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            ctrl.ishidden.toggle();
                          },
                          child: ctrl.ishidden.value == false
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
                        Get.back();
                      }
                    },
                    child: const Text('Ganti Password'))
              ],
            ),
          )),
    );
  }
}
