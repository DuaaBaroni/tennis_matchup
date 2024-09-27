// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tennis_matchup_app/core/utils/colors.dart';
import 'package:tennis_matchup_app/features/check/view/check.dart';
import 'package:tennis_matchup_app/features/fav/view/fav.dart';
import 'package:tennis_matchup_app/features/home/view/home_view.dart';
import 'package:tennis_matchup_app/features/profile/view/profile.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    super.key,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;
  List<Widget> views = [
    const HomeView(),
    const FavouriteView(),
    const CheckView(),
    const ProfileView(),
     
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 20,
          selectedItemColor: AppColors.green,
          unselectedItemColor: AppColors.black,
          showUnselectedLabels: true,
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: AppColors.white,
              icon: const Icon(Icons.home) ,
              activeIcon:const Icon(Icons.home) ,
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon:const Icon(Icons.star_border) ,
              activeIcon:const Icon(Icons.star),
              label: 'Favourite'
           ), 
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              activeIcon: Icon(Icons.person),
              label: 'Profile'
          ),
           BottomNavigationBarItem(
              icon: Icon(Icons.check_box),
              activeIcon: Icon(Icons.check_box),
              label: 'Check'
             ),
           ]
         ),
    );
  }
}


