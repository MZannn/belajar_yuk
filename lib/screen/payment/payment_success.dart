import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../nabung_yuk/dashboard_screen.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Yeayyy!!',
            style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Saldo Tabunganmu Bertambah Ayo Lebih semangat untuk menabung',
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Get.offAll(()=>const DashboardScreen());
            },
            child: Row(
              children: const[
                Icon(
                  Icons.arrow_circle_left_rounded,
                  color: Colors.white,
                  size: 26,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Back to Home Screen',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
          ),
        ]),
      ),
    );
  }
}
