import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabung_yuk/controller/dashboard_controller.dart';
import '../screen/authentication/login_screen.dart';
import '../screen/nabung_yuk/dashboard_screen.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get streamAuthStatus => _auth.authStateChanges();

  void login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user!.emailVerified) {
        Get.snackbar("Berhasil", "Login Sukses",
            backgroundColor: Colors.redAccent, colorText: Colors.white);
        Get.offAll(() => const DashboardScreen());
      } else {
        Get.defaultDialog(
            title: "Verifikasi",
            middleText: "Email Belum Diverifikasi",
            onConfirm: () async {
              await credential.user!.sendEmailVerification();
              Get.back();
            },
            radius: 5,
            buttonColor: Colors.redAccent,
            confirmTextColor: Colors.white,
            cancelTextColor: Colors.redAccent,
            textConfirm: "Kirim Ulang Verifikasi",
            onCancel: () {
              Get.back();
            },
            textCancel: "Kembali");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("Email tidak terdaftar", "Silahkan Daftar",
            backgroundColor: Colors.redAccent, colorText: Colors.white);
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Password Salah", "Silahkan Coba Lagi",
            backgroundColor: Colors.redAccent, colorText: Colors.white);
      }
    } catch (e) {
      Get.defaultDialog(middleText: "Tidak Dapat Login");
    }
  }

  void signUp(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      credential.user!.sendEmailVerification();
      Get.defaultDialog(
          middleText: "Verifikasi Email Sudah Terkirim, Silahkan Cek Email",
          textConfirm: "Ya",
          radius: 5,
          buttonColor: Colors.redAccent,
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
            Get.offAll(() => const LoginScreen());
          });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.defaultDialog(
            title: "Password Lemah",
            middleText: "Password harus lebih dari 6 Karakter");
      } else if (e.code == 'email-already-in-use') {
        Get.defaultDialog(
            title: "Email Sudah Terdaftar",
            middleText: "Silahkan coba email lain");
      }
    } catch (e) {
      Get.defaultDialog(middleText: "Tidak Dapat Login");
    }
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
    final controller = Get.find<DashboardController>();
    controller.tabIndex = 0;
    Get.offAll(() => const LoginScreen());
  }

  void changePassword(String newPassword) async {
    final credential = FirebaseAuth.instance.currentUser;
    try {
      await credential!.updatePassword(newPassword);
      Get.defaultDialog(
          radius: 5,
          buttonColor: Colors.redAccent,
          title: "Berhasil",
          confirmTextColor: Colors.white,
          middleText: "Ganti Password Sukses",
          onConfirm: () {
            Get.back();
            Get.back();
          },
          textConfirm: "Kembali Ke Profile");
    } catch (e) {
      Get.defaultDialog(
        title: "Kesalahan",
        middleText: "Password dan Confirm Password Harus Sama",
        onConfirm: () {
          Get.back();
        },
        textConfirm: "Ya",
        buttonColor: Colors.redAccent,
        confirmTextColor: Colors.white,
      );
    }
  }
}
