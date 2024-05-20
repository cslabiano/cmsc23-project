import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/donor.dart';
import '../models/org.dart';

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

  Future<String?> signUpDonor(Donor donor, String password) async {
    UserCredential credential;
    try {
      credential = await auth.createUserWithEmailAndPassword(
        email: donor.email,
        password: password,
      );

      // add the user's usertype to the collection "users"
      await db.collection("users").doc(credential.user!.uid).set({
        'usertype': donor.usertype,
      });

      await db.collection("donors").doc(credential.user!.uid).set({
        'email': donor.email,
        'fname': donor.fname,
        'lname': donor.lname,
        'uname': donor.uname,
        'contact': donor.contact,
        'address': donor.address
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

  Future<String?> signUpOrg(Org org, String password) async {
    UserCredential credential;
    try {
      credential = await auth.createUserWithEmailAndPassword(
        email: org.email,
        password: password,
      );

      // add the user's usertype to the collection "users"
      await db.collection("users").doc(credential.user!.uid).set({
        'usertype': org.usertype,
      });

      await db.collection("organizations").doc(credential.user!.uid).set({
        'email': org.email,
        'orgname': org.orgname,
        'uname': org.uname,
        'contact': org.contact,
        'address': org.address
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
