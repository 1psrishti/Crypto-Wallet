import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    debugPrint(e.toString());
    return false;
  }
}


Future<bool> register(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      debugPrint("Password is weak");
    } else if (e.code == 'email-already-in-use') {
      debugPrint("Email already in use");
    }
    return false;
  } catch (e) {
    debugPrint(e.toString());
    return false;
  }
}


Future addCoin(String id, String amount) async {
  try {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    var value = double.parse(amount);
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('coins')
        .doc(id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({'amount': value});
        return true;
      }
      double newAmount = snapshot['amount'] + value;
      transaction.update(documentReference, {'amount': newAmount});
      return true;
    });
  } catch (e) {
    return false;
  }
}


Future<bool> removeCoin(String id) async {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('coins')
      .doc(id)
      .delete();
  return true;
}