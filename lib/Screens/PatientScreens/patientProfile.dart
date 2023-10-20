import 'package:flutter/material.dart';
import 'package:helloworld/Routes/routes.dart';
import 'package:helloworld/services/database_service.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile({Key? key, required this.email}) : super(key: key);
  final String email;
  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  String fullNames = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    fullNames = (await FirestoreDatabase().getUserPatient(widget.email))!;
    setState(() {});
  }

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
                    Text(
                      'Hello $fullNames!',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
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
}
