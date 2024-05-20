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

  Future<String?> signIn(String uname, String password) async {
    try {
      // Search for the provided username in the database
      final QuerySnapshot result = await db
          .collection("users")
          .where('uname', isEqualTo: uname)
          .limit(1)
          .get();

      final List<DocumentSnapshot> documents = result.docs;

      if (documents.isNotEmpty) {
        // If username exists, retrieve its corresponding usertype
        final dynamic data = documents[0].data(); // Retrieve data from document

        if (data != null && data is Map<String, dynamic>) {
          final usertype = data['usertype']; // Access 'usertype' property

          if (usertype != null) {
            // Based on the usertype, query the corresponding collection
            String collectionName =
                (usertype == 'donor') ? 'donors' : 'organizations';

            // Query the corresponding collection to retrieve the email
            final QuerySnapshot userQuery = await db
                .collection(collectionName)
                .where('uname', isEqualTo: uname)
                .limit(1)
                .get();

            final List<DocumentSnapshot> userDocuments = userQuery.docs;

            if (userDocuments.isNotEmpty) {
              // Retrieve the email from the user document
              final userData = userDocuments[0].data();

              if (userData != null && userData is Map<String, dynamic>) {
                final email = userData['email']; // Access 'email' property

                if (email != null) {
                  // Perform sign-in with retrieved email and password
                  await auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  return null; // Return null on success
                } else {
                  // Email not found for the username
                  return "Email not found for the username";
                }
              }
            } else {
              // User document not found in the corresponding collection
              return "User not found";
            }
          } else {
            // Usertype not found for the username
            return "Usertype not found";
          }
        }
      } else {
        // Username not found in the database
        return "Username not found";
      }
    } on FirebaseAuthException catch (e) {
      // Handle authentication exceptions
      return e.message;
    } catch (e) {
      // Handle other exceptions
      return "Failed to sign in: $e";
    }
    return "";
  }

  Future<String?> signUpDonor(Donor donor, String password) async {
    if (await isUsernameTaken(donor.uname)) {
      return "Username already in use";
    }

    UserCredential credential;
    try {
      credential = await auth.createUserWithEmailAndPassword(
        email: donor.email,
        password: password,
      );

      // add the user's usertype to the collection "users"
      await db.collection("users").doc(credential.user!.uid).set({
        'uname': donor.uname,
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
    if (await isUsernameTaken(org.uname)) {
      return "Username already in use";
    }
    UserCredential credential;
    try {
      credential = await auth.createUserWithEmailAndPassword(
        email: org.email,
        password: password,
      );

      // add the user's usertype to the collection "users"
      await db.collection("users").doc(credential.user!.uid).set({
        'uname': org.uname,
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

  Future<bool> isUsernameTaken(String uname) async {
    final QuerySnapshot result = await db
        .collection("users")
        .where('uname', isEqualTo: uname)
        .limit(1)
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    return documents.isNotEmpty;
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
