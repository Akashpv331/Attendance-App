import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHelper{
  Future<void> addUserdata(Map<String,dynamic>userdetails,String id) async{
    await FirebaseFirestore.instance.collection("UserDetails").doc(id).set(userdetails);

  }
  Future<void> updateDetails(String id, Map<String, dynamic> updatedData) async {
    try {
      await FirebaseFirestore.instance.collection("UserDetails").doc(id).update(updatedData);
      print("Details updated for ID: $id");
    } catch (e) {
      print("Error updating details for ID $id: $e");
    }
  }
}