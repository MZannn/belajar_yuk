import 'package:firebase_auth/firebase_auth.dart';
import 'package:nabung_yuk/controller/dashboard_controller.dart';
import 'package:nabung_yuk/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screen/authentication/loading_screen.dart';
import 'screen/authentication/login_screen.dart';
import 'screen/nabung_yuk/dashboard_screen.dart';
import 'controller/auth_controller.dart';
import 'controller/home_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final authC = Get.put(AuthController());
  final bottomBar = Get.put(DashboardController());
  final loginC = Get.put(LoginController());
  final homeC = Get.put(HomeController());
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            title: 'Nabung Yuk',
            debugShowCheckedModeBanner: false,
            home: snapshot.data != null
                ? const DashboardScreen()
                : const LoginScreen(),
          );
        } else {
          return const LoadingScreen();
        }
      },
    );
  }
}
