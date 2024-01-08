import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_ninja/models/user_model.dart';
import 'package:food_ninja/utils/prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String? name,
    required String? email,
    required String? password,
  }) async {
    String result = 'Some error occurred';
    try {
      if (email!.isNotEmpty || name!.isNotEmpty || password!.isNotEmpty) {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: email, password: password!);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(PrefKeys.userId, user.user!.uid);
        prefs.setString(PrefKeys.userName, name!);
        prefs.setString(PrefKeys.userEmail, user.user!.email!);

        UserModel userModel = UserModel(
          email: email,
          name: name,
          uid: user.user!.uid,
        );

        await _firestore.collection('users').add(userModel.toJson());
        result = 'success';
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }

  Future<String> logInUser({
    required String email,
    required String password,
  }) async {
    String result = 'Some error occurred';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        var user = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        Prefs().setStringPrefs(PrefKeys.userId, user.user!.uid);
        Prefs().setStringPrefs(PrefKeys.userName, user.user!.displayName);
        Prefs().setStringPrefs(PrefKeys.userEmail, user.user!.email);
        result = 'success';
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }
}
