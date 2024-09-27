// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, unused_local_variable, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tennis_matchup_app/core/functions/dialog.dart';
import 'package:tennis_matchup_app/core/functions/email_validation.dart';
import 'package:tennis_matchup_app/core/functions/navigation.dart';
import 'package:tennis_matchup_app/core/services/app_local_storage.dart';
import 'package:tennis_matchup_app/core/utils/colors.dart';
import 'package:tennis_matchup_app/core/utils/style.dart';
import 'package:tennis_matchup_app/core/widgets/nav_bar.dart';
import 'package:tennis_matchup_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:tennis_matchup_app/features/auth/presentation/manager/auth_state.dart';
import 'package:tennis_matchup_app/features/auth/presentation/view/login.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _displayName = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isVisable = true;
  String name = "";
  String email = "";
  int? pass;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
           print("Done");
          pushAndRemoveUntil(context, NavBar());
        } else if (state is RegisterErrorState) {
          Navigator.pop(context);
          showErrorDialogg(context, state.error);
          // print("error");
        } else {
          showLoadingDialog(context);
          // print("error reg");
        }

      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 7, right: 7, bottom: 7),
          child: SingleChildScrollView(
            child: Form(
              key:  _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Text("Get Started",
                        style: getTitleStyle(fontSize: 20, color: AppColors.black)),
                  ),
                  Gap(7),
                  Text("by creating a free account.",
                      style: getBodyStyle(
                          color: AppColors.subText, fontWeight: FontWeight.normal)),
                  Gap(60),
                  TextFormField(
                      controller: _displayName,
                    decoration: InputDecoration(
                        hintText: "Enter your name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        fillColor: AppColors.subText.withOpacity(.10),
                        filled: true,
                        prefixIcon: Icon(Icons.person, color: AppColors.subText)),
                           validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your name';
                        }
                        return null;
                      },
                  ),
                  Gap(20),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText: "Enter your email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        fillColor: AppColors.subText.withOpacity(.10),
                        filled: true,
                        prefixIcon: Icon(Icons.mail, color: AppColors.subText)),
                       validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your name';
                          } else if (!emailValidate(value)) {
                            return "this email invalid";
                          } else {
                            return null;
                          }
                       }
                  ),
                  Gap(20),
                  TextFormField(
                   controller: _passwordController,
                    style: TextStyle(color: AppColors.black),
                    obscureText: isVisable,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: '********',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisable = !isVisable;
                          });
                        },
                        icon: Icon(
                            (isVisable)
                                ? Icons.visibility_off_rounded
                                : Icons.remove_red_eye,
                            color: AppColors.subText),
                      ),
                      prefixIcon: Icon(Icons.lock, color: AppColors.subText),
                    ),
                     validator: (value) {
                        if (value!.isEmpty) return 'please enter your password';
                        return null;
                      },
                  ),


                  Gap(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already a member?",
                          style: getSmallStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 16)),
                      TextButton(
                        onPressed: () {
                          navigateTo(context, LoginView());
                        },
                        child: Text(
                          "Login",
                          style: getSmallStyle(
                              color: AppColors.green, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Gap(100),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.green,
                      ),
                      onPressed: () 
                         {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthCubit>().registerUser(
                                _displayName.text,
                                _emailController.text,
                                _passwordController.text);
                          }
                             AppLocalStorage.cacheData('name', name);
                    
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "SIgnUp",
                            style: getSmallStyle(fontWeight: FontWeight.w600),
                          ),
                          const Gap(10),
                          Icon(Icons.arrow_forward_ios,
                              color: AppColors.white, size: 18)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  
}