import 'package:nabung_yuk/controller/text_controller.dart';
import 'package:nabung_yuk/screen/login/register_screen.dart';
import 'package:nabung_yuk/screen/nabung/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final ctrl = Get.put(TextController());
    return Scaffold(
      body: ListView(
        children: [
          Form(
              key: _formKey,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 300,
                        height: 300,
                        child: Image.asset('assets/images/icon.png')),
                    const Text(
                      'Login Now',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Please enter the details below to continue',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black26),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                        controller: ctrl.email,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          contentPadding: EdgeInsets.only(left: 40),
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: Colors.redAccent,
                          ),
                          labelText: 'Email',
                          hintText: 'Masukkan Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email Tidak Boleh Kosong';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() => TextFormField(
                          obscureText: ctrl.ishidden.value,
                          controller: ctrl.password,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            prefixIcon: const Icon(
                              Icons.key,
                              color: Colors.redAccent
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () => {
                                ctrl.ishidden.toggle(),
                              },
                              child: ctrl.ishidden.value == false
                                  ? const Icon(Icons.visibility_off,)
                                  : const Icon(Icons.visibility,color: Colors.redAccent),
                            ),
                            contentPadding: const EdgeInsets.only(left: 40),
                            labelText: 'Password',
                            hintText: 'Masukkan Password',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password Tidak Boleh Kosong';
                            }
                            return null;
                          },
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 35,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          String email = ctrl.email.text;
                          String password = ctrl.password.text;
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            if (email == "Fauzan" && password == "Fauzan123") {
                              Get.snackbar(
                                'Login Sukses',
                                'Welcome',
                                colorText: Colors.white,
                                isDismissible: true,
                                animationDuration:
                                    const Duration(milliseconds: 300),
                                duration: const Duration(seconds: 2),
                                backgroundColor: Colors.redAccent,
                              );
                              Get.off(() => const DashboardScreen());
                            } else {
                              Get.snackbar(
                                'Login Gagal',
                                'Email Atau Password Salah',
                                isDismissible: true,
                                animationDuration:
                                    const Duration(milliseconds: 300),
                                duration: const Duration(seconds: 2),
                              );
                            }
                          }
                        },
                        child: const Text('Login'),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don,t have an account? '),
                        TextButton(
                          onPressed: () {
                            ctrl.email.clear();
                            ctrl.password.clear();
                            Get.to(() => const RegisterScreen(),
                                transition: Transition.leftToRightWithFade,
                                duration: const Duration(milliseconds: 300));
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.redAccent,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
