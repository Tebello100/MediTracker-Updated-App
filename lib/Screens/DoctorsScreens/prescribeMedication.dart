import 'package:flutter/material.dart';
import 'package:helloworld/Routes/routes.dart';

class Prescribe extends StatefulWidget {
  const Prescribe({Key? key}) : super(key: key);

  @override
  State<Prescribe> createState() => _PrescribeState();
}

class _PrescribeState extends State<Prescribe> {
  final _formKey = GlobalKey<FormState>();

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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Prescribe Medication',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Image(image: AssetImage('Assets/Pharmacist.jpg')),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Instructions',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter instructions",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Cannot send prescription with this field empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Medication',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: "Enter medication"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Cannot send prescription with this field empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Save & Add',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context)
                              .pushNamed(RouteManager.doctorPage);
                        }
                      },
                      child: const Text(
                        "Send Prescription",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: const StadiumBorder(),
                        minimumSize: const Size.fromHeight(50),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
