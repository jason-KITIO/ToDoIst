import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todoist/google_auth_state.dart';

import 'package:flutter/material.dart';

import 'Screens/route.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  GoogleAuthCubit() : super(GoogleAuthInitialState());
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _auth = FirebaseAuth.instance;

  void login(BuildContext context) async {
    emit(GoogleAuthLoadingState());
    try {
      final userAccount = await _googleSignIn.signIn();

      if (userAccount == null) return;

      final GoogleSignInAuthentication googleAuth =
          await userAccount.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);

      emit(GoogleAuthSuccessState(userCredential.user!));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => route()),
      );
    } catch (e) {
      emit(GoogleAuthFailedState(e.toString()));
    }
  }
}
