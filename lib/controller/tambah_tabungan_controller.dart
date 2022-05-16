import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screen/payment/payment_success.dart';

class TambahTabunganController extends GetxController {
  final uangMasuk = TextEditingController();
  CollectionReference pemasukan =
      FirebaseFirestore.instance.collection("pemasukan");

  void addData(String email, String date, String uangMasuk) async {
    try {
      await pemasukan.add(
        {
          "email": email,
          "uangMasuk": int.parse(uangMasuk),
          "date": date,
        },
      );
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Data Berhasil dimasukkan",
          buttonColor: Colors.redAccent,
          confirmTextColor: Colors.white,
          onConfirm: () => Get.offAll(() => const PaymentSuccess()),
          textConfirm: "Ok");
    } catch (e) {
      Get.defaultDialog(
        title: "Gagal",
        middleText: "Data Gagal dimasukkan",
      );
    }
  }
}
