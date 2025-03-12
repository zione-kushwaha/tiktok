import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tiktok/constant.dart';
import 'package:tiktok/view/widgets/custom_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[pageIdx],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIdx,
          type: BottomNavigationBarType.fixed,
          backgroundColor: backgroundColor,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.white,
          onTap: (val) {
            setState(() {
              pageIdx = val;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Iconsax.home,
                  size: 30,
                  color: Colors.white,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Iconsax.search_favorite,
                  color: Colors.white,
                  size: 30,
                ),
                label: 'Search'),
            BottomNavigationBarItem(icon: CustomIcon(), label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Iconsax.message,
                  color: Colors.white,
                  size: 30,
                ),
                label: 'Message'),
            BottomNavigationBarItem(
                icon: Icon(
                  Iconsax.user,
                  color: Colors.white,
                  size: 30,
                ),
                label: 'Person'),
          ]),
    );
  }
}
