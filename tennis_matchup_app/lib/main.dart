// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_matchup_app/core/services/app_local_storage.dart';
import 'package:tennis_matchup_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:tennis_matchup_app/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding();
  await AppLocalStorage.init();
  Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyC8nhdWEFNo_BHAnDz22GAGxAv7CfjSVjs", 
      appId: "com.example.tennis_matchup_app", 
      messagingSenderId: "437936699275", 
      projectId: "tennis-app-bb323",
    )
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:BlocProvider(
        create: (context) => AuthCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SPlashView()
        ),
      ),
    );
  }
}
