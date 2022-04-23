import 'package:belajar_yuk/screen/login/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController nameCtrl = TextEditingController();
    TextEditingController emailCtrl = TextEditingController();
    TextEditingController passwordCtrl = TextEditingController();
    return Scaffold(
      body: Form(
          key: _formKey,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    labelText: 'Nama',
                    hintText: 'Masukkan Nama',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama Tidak Boleh Kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailCtrl,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.mail_outline),
                    border: OutlineInputBorder(),
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
                TextFormField(
                  controller: passwordCtrl,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.key),
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Masukkan Password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password Tidak Boleh Kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: () {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const LoginScreen(),));
                }, child: const Text('Register'))
              ],
            ),
          ))),
    );
  }
}
