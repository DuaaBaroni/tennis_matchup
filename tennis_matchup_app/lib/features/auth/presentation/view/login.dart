// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_string_escapes
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tennis_matchup_app/core/functions/dialog.dart';
import 'package:tennis_matchup_app/core/functions/email_validation.dart';
import 'package:tennis_matchup_app/core/functions/navigation.dart';
import 'package:tennis_matchup_app/core/utils/colors.dart';
import 'package:tennis_matchup_app/core/utils/style.dart';
import 'package:tennis_matchup_app/core/widgets/nav_bar.dart';
import 'package:tennis_matchup_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:tennis_matchup_app/features/auth/presentation/manager/auth_state.dart';
import 'package:tennis_matchup_app/features/auth/presentation/view/signup.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
        if (state is LoginSuccessState) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => navigateTo(context, NavBar())),
              (route) => false);
        } else if (state is LoginErrorState) {
          Navigator.of(context).pop(MaterialPageRoute(
            builder: (context) => showErrorDialogg(context, state.error),
          ));
        } else {
          showLoadingDialog(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                navigateTo(context, SignUpView());
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 7, right: 7, bottom: 7),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Text("Welcome back",
                      style:
                          getTitleStyle(fontSize: 20, color: AppColors.black)),
                ),
                Gap(7),
                Text("sign in to access your account",
                    style: getBodyStyle(
                        color: AppColors.subText,
                        fontWeight: FontWeight.normal)),
                Gap(60),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              hintText: "Enter your email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              fillColor: AppColors.subText.withOpacity(.10),
                              filled: true,
                              prefixIcon:
                                  Icon(Icons.mail, color: AppColors.subText)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your email';
                            } else if (!emailValidate(value)) {
                              return "it\s invalid email";
                            } else {
                              return null;
                            }
                          },
                          // onChanged: (value) {
                          //   setState(() {
                          //     email = value;
                          //   }
                          // );
                          // },
                        ),
                        Gap(20),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Enter your password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              fillColor: AppColors.subText.withOpacity(.10),
                              filled: true,
                              prefixIcon:
                                  Icon(Icons.lock, color: AppColors.subText)),
                          validator: (value) {
                            if (value!.isEmpty)
                              return 'please enter your password';
                            return null;
                          },
                        ),
                      ],
                    )),
                Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New Member?",
                        style: getSmallStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 16)),
                    TextButton(
                      onPressed: () {
                        navigateTo(context, SignUpView());
                      },
                      child: Text(
                        "Register now",
                        style: getSmallStyle(
                            color: AppColors.green,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Gap(140),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.green,
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await context.read<AuthCubit>().login(
                            _emailController.text, _passwordController.text);
                      }
                      //   if(email.isNotEmpty && pass!= null) {
                      //       navigateTo(context,NavBar());
                      //       AppLocalStorage.cacheData("email", email);
                      //       AppLocalStorage.cacheData("password", pass);
                      //       AppLocalStorage.cacheData("isUpload", true);
                      //   }else if (email.isEmpty && pass!=null){
                      //     showErrorDialog(context, "please enter your email");
                      //   }else{
                      //     showErrorDialog(context, "please enter your email and password");
                      // }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
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
    );
  }
}
