// google sign in service
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


Future<User?> signInWithGoogle() async {
  try {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential.user;
    } 
    return null; // Sign-in canceled by user
    
  } catch (e) {
    print("Error during Google sign-in: $e");
    return null;
  }
  
}

User? getCurrentUser() {
  return FirebaseAuth.instance.currentUser;

  }

