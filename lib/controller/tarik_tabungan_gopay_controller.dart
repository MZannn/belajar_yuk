import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screen/payment/payment_success.dart';

class TarikTabunganController extends GetxController {
  final uangKeluar = TextEditingController();
  final pengeluaran =
      FirebaseFirestore.instance.collection("pengeluaran");

  void addData(String email, String date, String uangKeluar) async {
    try {
      await pengeluaran.add(
        {
          "email": email,
          "uangKeluar": int.parse(uangKeluar),
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
