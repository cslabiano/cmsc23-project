import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthAPI {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  User? getUser() {
    return auth.currentUser; // sino nakalog-in
  }

  Stream<User?> userSignedIn() {
    // status ng authentication, may nakasign in ba or wala
    return auth.authStateChanges();
  }

  Future<String?> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return e.message;
      } else if (e.code == 'wrong-password') {
        return e.message;
      } else {
        return "Failed at ${e.code}: ${e.message}";
      }
    }
  }

  Future<String?> signUp(
      String email, String password, String firstname, String lastname) async {
    UserCredential credential;
    try {
      credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // add the user's name and email to the collection "users"
      await db.collection("users").doc(credential.user!.uid).set({
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
      });
      return "";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return e.message;
      } else if (e.code == 'email-already-in-use') {
        return e.message;
      } else if (e.code == 'invalid-email') {
        return e.message;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return null;
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
