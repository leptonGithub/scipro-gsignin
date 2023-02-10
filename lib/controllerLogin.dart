import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scipro/userDetailsModel.dart';

class ControllerLogin with ChangeNotifier{
  var googleSignInNow = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;

  UserDetailsModel? userDetailsModel;

  allowUserToLogin() async
  {
    this.googleSignInAccount = await googleSignInNow.signIn();

    this.userDetailsModel = new UserDetailsModel(

      displayName: this.googleSignInAccount!.displayName,
      email: this.googleSignInAccount!.email,
      photoUrl: this.googleSignInAccount!.photoUrl


    );
    notifyListeners();
  }
}