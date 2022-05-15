import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final pemasukan =
      FirebaseFirestore.instance.collection("pemasukan");
  final pengeluaran =
      FirebaseFirestore.instance.collection("pengeluaran");

  Stream<QuerySnapshot<Object?>> streamData() {
    return pemasukan.orderBy("date", descending: true).snapshots();
  }

  Future<List> getDataByEmail(String email) async {
    QuerySnapshot querySnapshot =
        await pemasukan.where("email", isEqualTo: email).get();
    List tabungan = [];
    for (var item in querySnapshot.docs) {
      tabungan.add(
        {
          "email": item['email'],
          "uang": item['uang'],
          "date": item['date'],
        },
      );
    }
    return tabungan;
  }
}
