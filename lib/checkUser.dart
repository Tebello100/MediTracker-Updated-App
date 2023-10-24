import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

Future<String?> getFullNames() async {
  final CollectionReference patients = firestore.collection('patients');
  final String uid = auth.currentUser!.uid;
  final result = await patients.doc(uid).get();

  if (result.exists) {
    final Map<String, dynamic>? data = result.data() as Map<String, dynamic>?;
    final String? fullNames = data?['fullNames'] as String?;
    return fullNames ?? null;
  } else {
    return null;
  }
}
