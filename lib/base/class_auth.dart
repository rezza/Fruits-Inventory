import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fruits_inventory/base/class_global_var.dart';
import 'package:fruits_inventory/base/class_utils.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ClassAuth {
  static Future<void> signInWithGoogle(State<dynamic> state) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn().catchError((onError) => printLog(onError));

    if(googleUser != null) {
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      var userCredential = await FirebaseAuth.instance.signInWithCredential(
          credential);

      state.setState(() {
        ClassGlobalVar.userLogin = userCredential.user;
      });
    }
  }

  static void signOut (State<dynamic> state) async {
    await FirebaseAuth.instance.signOut();
    User? user = FirebaseAuth.instance.currentUser;
    state.setState((){
      ClassGlobalVar.userLogin = user;
    });
  }
}