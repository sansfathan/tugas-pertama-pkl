// ignore_for_file: unused_import, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gudang/app/routes/app_pages.dart';

class AuthControllerController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  Stream<User?> streamAuthStatus() => auth.authStateChanges();
  String codeVerification = "";

  login(String emailAddress, String password) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: emailAddress, password: password);
      // log("===================");
      // log(credential.toString());
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.defaultDialog(
            title: "perhatian", middleText: "user tidak di temukan");
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.defaultDialog(
            title: "perhatian",
            middleText: "password salah silahkan isi dengan benar!");
      }
    }
  }

  logOut() {
    Get.defaultDialog(
        title: "yakin Log Out?",
        middleText: "Log Out bro",
        confirm: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Get.offAllNamed(Routes.LOGIN);
            print("berhasil Log Out");
          },
          child: Text("yes"),
        ),
        cancel: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
          onPressed: () => Get.back(),
          child: Text("No"),
        ));
  }
}
