import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabung_yuk/screen/payment/tarik_tabungan_gopay.dart';

class TarikTabungan extends StatelessWidget {
  const TarikTabungan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              const Text(
                'Tarik Tabungan',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                const Icon(Icons.payment),
                Expanded(
                    flex: 0,
                    child: TextButton(
                      child: const Text(
                        'GoPay',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Get.off(() => const TarikTabunganGopay());
                      },
                    ))
              ],
            ),
          )
        ]),
      ),
    );
  }
}
