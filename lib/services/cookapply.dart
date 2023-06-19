import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CookApply extends StatefulWidget {
  const CookApply({super.key});

  @override
  State<CookApply> createState() => _CookApplyState();
}

class _CookApplyState extends State<CookApply> {
  TextEditingController duration = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController comment = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  String image = "";
  // String? email=place.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const SizedBox(
                  height: 40,
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: namecontroller,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      isDense: true,
                      contentPadding: EdgeInsets.all(14),
                      label: Text('Name'),
                      fillColor: Color.fromARGB(120, 255, 255, 255),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255))),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220)))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: place,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.home),
                      isDense: true,
                      contentPadding: EdgeInsets.all(14),
                      label: Text('Place'),
                      fillColor: Color.fromARGB(120, 255, 255, 255),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255))),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220)))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: duration,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.punch_clock),
                      isDense: true,
                      contentPadding: EdgeInsets.all(14),
                      label: Text('Duration'),
                      fillColor: Color.fromARGB(120, 255, 255, 255),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255))),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220)))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: comment,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.comment),
                      isDense: true,
                      contentPadding: EdgeInsets.all(14),
                      label: Text('Comments'),
                      fillColor: Color.fromARGB(120, 255, 255, 255),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255))),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220)))),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color.fromARGB(255, 1, 0, 27), // Background color
                    ),
                    onPressed: () async {
                      // role() {
                      //   String roles = AuthServices().currentuser().toString();
                      //   print(roles);
                      // }

                      await FirebaseFirestore.instance
                          .collection('cookapply')
                          .doc()
                          .set(
                        {
                          "name": namecontroller.text.trim(),
                          "place": place.text.trim(),
                          "duration": duration.text.trim(),
                          "comment": comment.text.trim(),
                          "uid": FirebaseAuth.instance.currentUser!.uid,
                        },
                      );
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: const Text(
                          'UPLOAD',
                          style: TextStyle(fontSize: 20),
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
