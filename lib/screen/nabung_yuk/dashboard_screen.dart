import 'package:nabung_yuk/controller/dashboard_controller.dart';
import 'package:nabung_yuk/screen/nabung/home_screen.dart';
import 'package:nabung_yuk/screen/nabung/tambah_tabungan_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabung_yuk/screen/nabung_yuk/profile_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        Get.find<DashboardController>();
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: const [
                HomeScreen(),
                ProfileScreen(),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => const Menabung());
            },
            child: const Icon(Icons.add),
            backgroundColor: Colors.redAccent,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color: Colors.redAccent,
            shape: const CircularNotchedRectangle(),
            notchMargin: 5,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    controller.changeTabIndex(0);
                  },
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.changeTabIndex(1);
                  },
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
