import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:joso_app/choice.dart';
import 'package:joso_app/cookapply.dart';
import 'package:joso_app/frontprofile.dart';
import 'package:joso_app/homepage.dart';
import 'package:joso_app/housejobapply.dart';
import 'package:joso_app/joso.dart';
import 'package:joso_app/login.dart';
import 'package:joso_app/partime1.dart';
import 'package:joso_app/profile.dart';
import 'package:joso_app/register.dart';
import 'catererjobapply.dart';
import 'firebase_options.dart';
// import 'dart:js';
//import 'package:joso_app/email_verification.dart';
//import 'package:joso_app/housekeeperadd.dart';
// import 'package:joso_app/tutoradd.dart';
//import 'package:joso_app/driver.dart';
//import 'package:joso_app/driveradd.dart';
//import 'package:joso_app/Housekeeper.dart';
// import 'package:joso_app/Tutor.dart';
//import 'package:joso_app/caterer.dart';
//import 'package:joso_app/catereradd.dart';
// import 'package:joso_app/vol1.dart';
// import 'package:joso_app/voluntaryadd.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'homepage',
    routes: {
      'joso': (context) => const Myjoso(),
      'homepage': (context) => MyHomePage(),
      'login': (context) => const MyLogin(),
      'register': (context) => const MyRegister(),
      'choice': (context) => const mychoice(),
      'partime1': (context) => const MyPartime1(),
      'cookapply': (context) => const Mycookapply(),
      'housejobapply': (context) => const Myhouseapply(),
      'catererjobapply': (context) => const Mycatererapply(),
      'frontprofile': (context) => const Myfrontprofile(),
      'profile': (context) => const Myprofile(),
      // 'Tutor': (context) => const Mytutor(),
      // 'Housekeeper': (context) => const Myhousekeeper(),
      // 'caterer': (context) => const Mycaterer(),
      // 'driver': (context) => const Mydriver(),
      // 'tutoradd': (context) => const Mytutoradd(),
      // 'housekeeperadd': (context) => const Myhousekeeperadd(),
      // 'catereradd': (context) => const Mycatereradd(),
      // 'driveradd': (context) => const Mydriveradd(),
      // 'voluntaryadd': (context) => const Myvoluntaryadd(),
      //'email_verification': (context) => EmailVerificationPage(),
      // 'tutorjobapply': (context) => const Mytutorapply(),
      // 'vol1': (context) => const Myvol1(),
    },
  ));
}
