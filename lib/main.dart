import 'package:belajar_yuk/screen/buku/belajar_yuk_view_model.dart';
import 'package:belajar_yuk/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => BelajarYukViewModel(),
      )
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Belajar Yuk',
      home: LoginScreen(),
    ),
  ));
}
