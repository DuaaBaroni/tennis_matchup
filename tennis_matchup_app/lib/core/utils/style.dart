import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tennis_matchup_app/core/utils/colors.dart';

getTitleStyle({double?fontSize, Color?color, FontWeight?fontWeight}){
    return TextStyle(
       fontSize:fontSize?? 23,
       color: color?? AppColors.green,
       fontWeight:fontWeight?? FontWeight.w700,
       fontFamily: GoogleFonts.prata().fontFamily
    );
 }

getBodyStyle({double?fontSize, Color?color, FontWeight?fontWeight}){
    return TextStyle(
       fontSize:fontSize?? 20,
       color: color?? AppColors.black,
       fontWeight:fontWeight?? FontWeight.w500,
       fontFamily: GoogleFonts.prata().fontFamily
    );
 }

 getSmallStyle({double?fontSize, Color?color, FontWeight?fontWeight}){
    return TextStyle(
       fontSize:fontSize?? 16,
       color: color?? AppColors.white,
       fontWeight:fontWeight?? FontWeight.normal,
       fontFamily: GoogleFonts.prata().fontFamily
   );
 }
