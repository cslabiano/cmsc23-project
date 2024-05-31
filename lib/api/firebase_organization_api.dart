import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/org_model.dart';

class FirebaseOrganizationAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  // get all organizations that accepts donations
  Stream<QuerySnapshot> getAllOrganizations() {
    return db
        .collection("organizations")
        .where("isVerified", isEqualTo: true)
        .snapshots();
  }

  // get all donations to an organization
  Stream<QuerySnapshot> getDonationsToOrganization(String userId) {
    return db
        .collection("donations")
        .where("orgId", isEqualTo: userId)
        .snapshots();
  }

  // create an organization
  Future<String> addOrganization(organization) async {
    print("%%%%%%%%%%%%%%%%%%%%%%5\naddorgapi");
    print(organization);
    try {
      await db.collection("organizations").add(organization);
      return "Successfully added organization!";
    } on FirebaseException catch (e) {
      return "Error in ${e.code}: ${e.message}";
    }
  }

  // edit organization donation status
  Future<String> editOrganizationDonationStatus(
      String id, String status) async {
    try {
      await db
          .collection("organizations")
          .doc(id)
          .update({"donationStatus": status});
      return "Successfully edited organization donation status!";
    } on FirebaseException catch (e) {
      return "Error in ${e.code}: ${e.message}";
    }
  }

  Future<Org?> getDetails(User user) async {
    try {
      DocumentSnapshot doc =
          await db.collection("organizations").doc(user.uid).get();
      if (doc.exists) {
        return Org.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        print('Document does not exist');
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Org> getOrg(String orgId) async {
    DocumentSnapshot doc =
        await db.collection("organizations").doc(orgId).get();

    if (doc.exists) {
      return Org.fromJson(doc.data() as Map<String, dynamic>);
    } else {
      throw Exception("Organization document does not exist");
    }
  }

  Stream<QuerySnapshot> getOrgStream(String id) {
    return db
        .collection("organizations")
        .where("isVerified", isEqualTo: true)
        .where("orgId", isEqualTo: id)
        .snapshots();
  }
}
