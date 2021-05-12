import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_app/app/controller/home_controller/bottom_navigation_controller.dart';
import 'package:salon_app/app/ui/android/home/discover/discover_screen.dart';

import '../../theme/app_colors.dart';

class HomePage extends StatelessWidget {
  final controller =
      Get.put<BottomNavigatorController>(BottomNavigatorController());

  List<Widget> _children = [
    DiscoverScreen(),
    DiscoverScreen(),
    DiscoverScreen(),
    DiscoverScreen(),
    DiscoverScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: primaryColor,
            unselectedItemColor: Colors.grey,
            currentIndex: controller.selectedIndex,
            onTap: (value) {
              controller.onItemTapped(value);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Discover"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt), label: "Notify"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.date_range), label: "Appoinment"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), label: "Messages"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
          body: _children[controller.selectedIndex],
        ));
  }
}
