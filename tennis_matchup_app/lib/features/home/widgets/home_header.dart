// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tennis_matchup_app/core/functions/navigation.dart';
import 'package:tennis_matchup_app/core/services/app_local_storage.dart';
import 'package:tennis_matchup_app/core/utils/colors.dart';
import 'package:tennis_matchup_app/core/utils/style.dart';
import 'package:tennis_matchup_app/features/profile/view/profile.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    super.key,
  });

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String? path;
  String name = "";

  @override
  void initState() {
    super.initState();
      name = AppLocalStorage.getCacheData('name');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, $name',
              style: getTitleStyle(color: AppColors.black ,fontSize: 18),
            ),
            Gap(5),
            Text(
              'Have A Nice Day !',
              style: getBodyStyle(color: AppColors.subText ,fontSize: 16),
            ),
          ],
        ),
        const Spacer(),
         IconButton(
          onPressed: (){}, 
          icon: Icon(Icons.menu)
        ),
      ],
    );
  }
}
