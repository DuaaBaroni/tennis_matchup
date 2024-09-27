// ignore_for_file: unused_element, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tennis_matchup_app/core/utils/colors.dart';
import 'package:tennis_matchup_app/core/utils/style.dart';

showErrorDialog(context, text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.white,
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      content: Text(text,style: getSmallStyle(color:AppColors.red, fontWeight: FontWeight.w800),
        ),
      )
    );
}

// error dialog
showErrorDialogg(context, errorText) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(errorText)
      )
      );
}
  

showLoadingDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(.7),
    context: context,
    builder: (BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
             color: AppColors.green,
          )
        ],
      );
    },
  );
 }
    


