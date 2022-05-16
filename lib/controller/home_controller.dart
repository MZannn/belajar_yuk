import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final pemasukan = FirebaseFirestore.instance.collection("pemasukan");
  final pengeluaran = FirebaseFirestore.instance.collection("pengeluaran");

  Stream<QuerySnapshot<Object?>> streamPemasukan() {
    return pemasukan.orderBy("date", descending: true).snapshots();
  }

  Stream<QuerySnapshot<Object?>> streamPengeluaran() {
    return pengeluaran.orderBy("date", descending: true).snapshots();
  }

  Future<List> getDataByEmail(String email) async {
    QuerySnapshot querySnapshot =
        await pemasukan.where("email", isEqualTo: email).get();
    final tabungan = <Map<String,dynamic>>[];
    for (var item in querySnapshot.docs) {
      tabungan.add(
        {
          "email": item['email'],
          "uangMasuk": item['uangMasuk'],
          "date": item['date'],
        },
      );
    }
    QuerySnapshot snapshot =
        await pengeluaran.where("email", isEqualTo: email).get();
    for (var item in snapshot.docs) {
      tabungan.add(
        {
          "email": item['email'],
          "uangKeluar": item['uangKeluar'],
          "date": item['date'],
        },
      );
    }
    return tabungan;
  }
  
}
