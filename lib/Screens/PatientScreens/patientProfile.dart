import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/Routes/routes.dart';
import 'package:helloworld/checkUser.dart';
import 'package:helloworld/services/database_service.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile({Key? key, required this.clinicFileNo})
      : super(key: key);
  final String clinicFileNo;
  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  @override
  void initState() {
    super.initState();
  }

  String? fullNames;
  String? surname;
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                colors: [Colors.red, Colors.white])),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Image(
                  image: AssetImage(
                    'Assets/1logo.png',
                  ),
                  width: 200,
                  height: 150,
                ),
                Row(
                  children: [
                    const Image(
                      image: AssetImage('Assets/Patient.jpg'),
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    FutureBuilder<String?>(
                        future: getFullNames(),
                        builder: (context, AsyncSnapshot snapshot) {
                          return Text(snapshot.data.toString());
                        })
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 200,
                      height: 100,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(RouteManager.updatePatientProfile);
                          },
                          child: const Text(
                            'Patient Profile',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 200,
                      height: 100,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(RouteManager.prescriptionHistory);
                          },
                          child: const Text(
                            'Prescription History',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 200,
                      height: 100,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(RouteManager.reminder);
                          },
                          child: const Text(
                            'Consumption Reminder',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 200,
                      height: 100,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(RouteManager.messages);
                          },
                          child: const Text(
                            'Messages',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(RouteManager.home);
                      },
                      child: const Text(
                        'Log out',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: const StadiumBorder(),
                        alignment: Alignment.bottomRight,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future getData() async {
  //   User firebaseUser = FirebaseAuth.instance.currentUser!;

  //   if (firebaseUser != null) {
  //     String? uid = firebaseUser.email;
  //     DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
  //         .instance
  //         .collection('patients')
  //         .doc(uid)
  //         .get();
  //     if (snapshot.exists) {
  //       Map<String, dynamic>? data = snapshot.data();
  //       if (data != null) {
  //         setState(() {
  //           fullNames = data['fullNames'];
  //           surname = data['surname'];
  //         });
  //       } else {
  //         print("Document data was null");
  //       }
  //     } else {
  //       print("Document does not exist on the database");
  //     }
  //   } else {
  //     print('User is not logged in');
  //   }
  // }
}
