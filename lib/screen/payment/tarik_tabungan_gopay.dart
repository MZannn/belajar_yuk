import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nabung_yuk/controller/home_controller.dart';
import 'package:nabung_yuk/controller/login_controller.dart';
import 'package:nabung_yuk/controller/tarik_tabungan_gopay_controller.dart';

class TarikTabunganGopay extends StatelessWidget {
  const TarikTabunganGopay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tarikC = Get.put(TarikTabunganController());
    final loginC = Get.find<LoginController>();
    final homeC = Get.find<HomeController>();
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: tarikC.uangKeluar,
        builder: (BuildContext context, value, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(children: [
              const Text(
                'Masukkan Nominal',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 40,
                child: TextFormField(
                  controller: tarikC.uangKeluar,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 10),
                    hintText: '100000',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          const BorderSide(style: BorderStyle.none, width: 0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const ListTile(
                    leading: Icon(Icons.payment),
                    title: Text('Gopay'),
                    subtitle: Text('Saldomu : Rp 10.000.000'),
                  ),
                  FutureBuilder(
                    future: homeC.getDataByEmail(loginC.email.text),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.data != null) {
                        int uangMasuk = 0;
                        int uangKeluar = 0;
                        for (var item
                            in snapshot.data as List<Map<String, dynamic>>) {
                          uangMasuk += (item['uangMasuk'] ?? 0)! as int;
                          uangKeluar += (item['uangKeluar'] ?? 0)! as int;
                        }
                        return ElevatedButton(
                          onPressed: () {
                            var totalUang = uangMasuk - uangKeluar;
                            var tarikUangKeluar =
                                int.parse(tarikC.uangKeluar.text);
                            final format = DateFormat("dd-MM-yyyy HH:mm:ss");
                            final date =
                                format.format(DateTime.now()).toString();
                            if (tarikUangKeluar - totalUang <= 0 ) {
                              tarikC.addData(loginC.email.text, date,
                                  tarikC.uangKeluar.text);
                                  tarikC.uangKeluar.clear();
                            } else {
                              Get.defaultDialog(
                                  title: "Saldo Anda Tidak Cukup",
                                  middleText:
                                      "Saldo Anda Tersisa $totalUang, Lanjut Penarikan",
                                  buttonColor: Colors.redAccent,
                                  cancelTextColor: Colors.redAccent,
                                  confirmTextColor: Colors.white,
                                  textConfirm: "Ya",
                                  textCancel: "Tidak",
                                  onCancel: () {
                                    Get.back();
                                    Get.back();
                                  },
                                  onConfirm: () {
                                    Get.back();
                                  });
                            }
                          },
                          child: Row(
                            children: [
                              const Expanded(
                                  child: Text(
                                'Konfirmasi & Bayar',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                              Text('Rp. ${tarikC.uangKeluar.value.text}'),
                              const Icon(
                                Icons.arrow_circle_right_sharp,
                                size: 27,
                              )
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 13, 161, 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  )
                ],
              )
            ]),
          );
        },
      ),
    );
  }
}
