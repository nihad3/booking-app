import 'package:booking_app/pages/booking.dart';
import 'package:booking_app/pages/home.dart';
import 'package:booking_app/pages/profile.dart';
import 'package:booking_app/pages/wallet.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart'; // ✅ You forgot this import

class Bottomnav extends StatefulWidget {
  const Bottomnav({Key? key}) : super(key: key);

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  late List<Widget> pages;
  late Home homePage;
  late Booking booking;
  late Profile profile;
  late Wallet wallet; 

  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    homePage = Home();
    booking = Booking();
    profile = Profile();
    wallet = Wallet();

    pages = [homePage, booking, wallet, profile];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentTabIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: const Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: const [
          Icon(Icons.home, color: Colors.white, size: 30.0),
          Icon(Icons.shopping_bag, color: Colors.white, size: 30.0),
          Icon(Icons.wallet, color: Colors.white, size: 30.0),
          Icon(Icons.person, color: Colors.white, size: 30.0),
        ],
      ),
    );
  }
}
