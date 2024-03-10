import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridesharingapp/resources/colors/color.dart';
import 'package:ridesharingapp/resources/routes/routes_name.dart';
import 'package:ridesharingapp/view/home_screen/home_screen.dart';
import 'package:ridesharingapp/view/my_ride_screen/my_ride_screen.dart';
import 'package:ridesharingapp/view/offer_screen/offer_screen.dart';
import 'package:ridesharingapp/view/profile_page.dart';
import 'package:ridesharingapp/view/side_drawer/side_drawer.dart';

import '../../view_model/profile/profile_screen_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final profileVm = ProfileScreenController();
  int selected = 0;
  List screens = [
    HomeScreen(),
    MyRideScreen(),
    HomeScreen(),
    const OfferScreen(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor50,
        actions: [
          IconButton(
              color: AppColors.primaryColor,
              onPressed: () {
                Get.toNamed(RoutesName.notificationScreen);
              },
              icon: const Icon(Icons.notifications_none))
        ],
      ),
      drawer: SideDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: AppColors.blackColor,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.primaryColor700,
        currentIndex: selected,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            selected = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_taxi_outlined), label: 'My Ride'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Wallet'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer_sharp), label: 'Offer'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: screens[selected],
    );
  }
}
