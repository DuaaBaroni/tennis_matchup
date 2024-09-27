// ignore_for_file: empty_catches, avoid_print, unused_element, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_matchup_app/core/services/app_local_storage.dart';
import 'package:tennis_matchup_app/features/auth/presentation/manager/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
    static AuthCubit get(context) => BlocProvider.of(context);
   String name = "";
  // login
  login(String email, String password) async {
    emit(LoginLoadingState());
   
                      
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginErrorState('Account does not exist '));
      } else if (e.code == 'wrong-password') {
        emit(LoginErrorState('wrong password'));
      } else {
        emit(LoginErrorState('have a problem try later'));
      }
    }
  }

  registerUser(String name, String email, String password) async {
    emit(RegisterLoadingState());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = credential.user!;
      user.updateDisplayName(name);

      // store in firestore
      FirebaseFirestore.instance.collection('user').doc(user.uid).set({
        'name': name,
        'email': user.email,
        'uid': user.uid,
      }, SetOptions(merge: true));
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterErrorState('password is weak'));
      } else if (e.code == 'email-already-found') {
        emit(RegisterErrorState('The account already exists'));
      } else {
        emit(RegisterErrorState('There was a problem in the registration'));
      }
    } catch (e) {
      emit(RegisterErrorState('There was a problem in the registration'));
    }
  }
}
