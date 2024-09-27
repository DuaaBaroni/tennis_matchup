import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:tennis_matchup_app/core/functions/navigation.dart';
import 'package:tennis_matchup_app/core/services/app_local_storage.dart';
import 'package:tennis_matchup_app/core/utils/colors.dart';
import 'package:tennis_matchup_app/core/utils/style.dart';
import 'package:tennis_matchup_app/core/widgets/nav_bar.dart';
import 'package:tennis_matchup_app/features/auth/presentation/view/signup.dart';

class SPlashView extends StatefulWidget {
  const SPlashView({super.key});

  @override
  State<SPlashView> createState() => _SPlashViewState();
}

class _SPlashViewState extends State<SPlashView> {
  @override
  void initState() {
  //  bool isUpload = AppLocalStorage.getCacheData('isUpload') ?? false;

     Future.delayed(const Duration(seconds: 3),(){
         navigateTo(context,const SignUpView());
     });
   super.initState();
 }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
       body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Center(child: Lottie.asset("assets/Animation - 1727015364697.json")
          ),
           Text("TENNISMATE",style: getTitleStyle(),
          ),
         const Gap(10),
           Text("Connect . Meet . Play", style: getTitleStyle(color: AppColors.black, fontSize: 19),
           ),
         ],
       ),
    );
  }
}
