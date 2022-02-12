import 'package:crypto_wallet/ui/authentication.dart';
import 'package:crypto_wallet/ui/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      title: "Crypto Wallet",
      home: (FirebaseAuth.instance.currentUser != null)
          ? const HomeScreen()
          : const Authentication(),
    );
  }
}