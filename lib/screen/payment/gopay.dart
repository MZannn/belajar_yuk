import 'package:nabung_yuk/controller/text_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabung_yuk/screen/payment/payment_success.dart';

class Gopay extends StatelessWidget {
  const Gopay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TextController>(
      builder: (ctrl) {
        Get.put(TextController());
        final totalUang = ctrl.totalUang.text;
        return Scaffold(
          body: Padding(
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
                  controller: ctrl.totalUang,
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
                    subtitle: Text('Saldomu : Rp'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.off(() => const PaymentSuccess());
                    },
                    child: Row(
                      children: [
                        const Expanded(
                            child: Text(
                          'Konfirmasi & Bayar',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        Text('Rp. '+totalUang),
                        const Icon(
                          Icons.arrow_circle_right_sharp,
                          size: 27,
                        )
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 13, 161, 18),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                  )
                ],
              )
            ]),
          ),
        );
      },
    );
  }
}
