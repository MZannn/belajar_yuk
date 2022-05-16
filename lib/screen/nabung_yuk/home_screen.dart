import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabung_yuk/controller/home_controller.dart';
import 'package:nabung_yuk/controller/login_controller.dart';
import 'tarik_tabungan_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        cardPage(),
        tabPage(),
      ],
    ));
  }

  Widget cardPage() {
    final loginC = Get.find<LoginController>();
    final homeC = Get.find<HomeController>();
    return Container(
      height: 280,
      padding: const EdgeInsets.all(50),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.red.shade400, Colors.red.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Card(
        elevation: 50,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                colors: [
                  Colors.red.shade700,
                  Colors.red.shade400,
                  Colors.redAccent.shade200,
                  Colors.redAccent.shade100,
                  Colors.grey.shade300,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hai ${loginC.email.text}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              const Text("Your Wallet",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              Expanded(
                child: FutureBuilder(
                  future: homeC.getDataByEmail(loginC.email.text),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      int uangMasuk = 0;
                      int uangKeluar = 0;
                      for (var item
                          in snapshot.data as List<Map<String, dynamic>>) {
                        uangMasuk += (item['uangMasuk'] ?? 0)! as int;
                        uangKeluar += (item['uangKeluar'] ?? 0)! as int;
                      }
                      int totalUang = uangMasuk - uangKeluar;
                      return Text(
                        "Rp. " + totalUang.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      );
                    } else {
                      return const Text(
                        "Rp. 0",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 30,
                child: IconButton(
                onPressed: () {
                  Get.to(() => const TarikTabungan());
                },
                icon: const Icon(Icons.output_outlined),
                iconSize: 20,
                color: Colors.white,
              ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget tabPage() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.red.shade300, Colors.red.shade100],
              begin: Alignment.topLeft,
              end: Alignment.topRight)),
      child: Container(
        height: 480,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.red.shade300, spreadRadius: 5, blurRadius: 7)
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.white,
        ),
        child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TabBar(
                indicatorColor: Colors.redAccent,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: 'Pemasukan',
                  ),
                  Tab(
                    text: 'Pengeluaran',
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5))),
                  child: TabBarView(children: [pemasukan(), pengeluaran()]),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget pemasukan() {
    final controller = Get.put(HomeController());
    final loginC = Get.find<LoginController>();
    return StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streamPemasukan(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listAllDocs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: listAllDocs.length,
              itemBuilder: (BuildContext context, int index) {
                if (loginC.email.text ==
                    ((listAllDocs[index].data()
                        as Map<String, dynamic>)["email"])) {
                  return ListTile(
                    leading: const Icon(Icons.attach_money_outlined),
                    title: const Text("Pemasukan"),
                    subtitle: Text(
                        "${(listAllDocs[index].data() as Map<String, dynamic>)["date"]}"),
                    trailing: Text(
                        "Rp. ${(listAllDocs[index].data() as Map<String, dynamic>)["uangMasuk"]}"),
                  );
                }
                return const SizedBox();
                // tabPage();
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.redAccent,
            ),
          );
        });
  }

  Widget pengeluaran() {
    final homeC = Get.put(HomeController());
    final loginC = Get.find<LoginController>();
    return StreamBuilder<QuerySnapshot<Object?>>(
        stream: homeC.streamPengeluaran(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listAllDocs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: listAllDocs.length,
              itemBuilder: (BuildContext context, int index) {
                if (loginC.email.text ==
                    ((listAllDocs[index].data()
                        as Map<String, dynamic>)["email"])) {
                  return ListTile(
                    leading: const Icon(Icons.call_missed_outgoing),
                    title: const Text("Pengeluaran"),
                    subtitle: Text(
                        "${(listAllDocs[index].data() as Map<String, dynamic>)["date"]}"),
                    trailing: Text(
                        "Rp. ${(listAllDocs[index].data() as Map<String, dynamic>)["uangKeluar"]}"),
                  );
                }
                return const SizedBox();
                // tabPage();
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.redAccent,
            ),
          );
        });
  }
}
