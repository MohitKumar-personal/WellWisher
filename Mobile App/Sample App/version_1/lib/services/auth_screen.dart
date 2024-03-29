import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/dashboardScreen.dart';
import '../screens/dashboardScreen2.dart';
import 'login_or_registerScreen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          //User is Logged in
          if(snapshot.hasData){
            return DashBoardScreen();
          }

          //User is not Logged In
          else{
            return LoginOrRegisterScreen();
          }
        },
      )
    );
  }
}
