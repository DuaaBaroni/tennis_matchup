// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:gap/gap.dart';
import 'package:tennis_matchup_app/core/utils/colors.dart';
import 'package:tennis_matchup_app/features/home/widgets/home_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Padding(
           padding: EdgeInsets.all(10),
           child: Column(
             children: [
                HomeHeader(),
              Gap(30),
             
             ],
           ),
         ),
     );
  }
}

