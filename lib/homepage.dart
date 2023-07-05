import 'dart:async';
import 'package:flutter/material.dart';
import 'package:joso_app/choice.dart';
import 'package:joso_app/joso.dart';
import 'package:joso_app/login.dart';
import 'package:joso_app/securestorage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

String? fvalue;
// final secure = SecureStorage();

class _MyHomePageState extends State<MyHomePage> {
  final secure = SecureStorage();

  @override
  void initState() {
    // secure.readSecureData('email').then((value) {
    //   fvalue = value;
    // });

    super.initState();
    secure.readSecureData('email').then((value) {
      fvalue = value;
    });
    Timer(const Duration(seconds: 3), () {
      if (fvalue == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Myjoso()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const mychoice()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 0, 27),
    );

    // return Container(
    //   decoration: BoxDecoration(
    //     image: DecorationImage(
    //       image: AssetImage('assets/images/Untitogo-1.png'),
    //     ),
    //   ),
    // );
  }
}
