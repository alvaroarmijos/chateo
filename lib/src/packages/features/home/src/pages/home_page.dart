import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ChateoColors.black,
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Future.wait([
                GoogleSignIn().signOut(),
                FirebaseAuth.instance.signOut(),
              ]);
            },
            child: const Text("Log out")),
      ),
    );
  }
}
