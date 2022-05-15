import 'package:nabung_yuk/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabung_yuk/controller/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final authC = Get.find<AuthController>();
    final regisC = Get.find<RegisterController>();
    return Scaffold(
      body: ListView(
        children: [
          Form(
              key: _formKey,
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 300,
                          height: 300,
                          child: Image.asset('assets/images/icon.png')),
                      const Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Please enter the details below to continue',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black26),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      
                      TextFormField(
                        controller: regisC.email,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          contentPadding: EdgeInsets.only(left: 40),
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: Color.fromARGB(255, 248, 76, 76),
                          ),
                          labelText: 'Email',
                          hintText: 'Masukkan Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email Tidak Boleh Kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(() => TextFormField(
                            obscureText: regisC.ishidden.value,
                            controller: regisC.password,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide()),
                              prefixIcon: const Icon(
                                Icons.key,
                                color: Color.fromARGB(255, 248, 76, 76),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  regisC.ishidden.toggle();
                                },
                                icon: regisC.ishidden.value == false
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
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
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              authC.signUp(regisC.email.text, regisC.password.text);
                            }
                          },
                          child: const Text('Register'),
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
                          const Text('Already have an account? '),
                          TextButton(
                            onPressed: () {
                              regisC.email.clear();
                              regisC.password.clear();
                              Get.back();
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Color.fromARGB(255, 248, 76, 76),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ))),
        ],
      ),
    );
  }
}
