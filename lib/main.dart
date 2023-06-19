// import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:joso_app/Housekeeper.dart';
import 'package:joso_app/Tutor.dart';

import 'package:joso_app/caterer.dart';
import 'package:joso_app/catereradd.dart';
import 'package:joso_app/choice.dart';
import 'package:joso_app/cook.dart';
import 'package:joso_app/cookadd.dart';
import 'package:joso_app/cookapply.dart';
import 'package:joso_app/driver.dart';
import 'package:joso_app/driveradd.dart';
import 'package:joso_app/frontprofile.dart';

import 'package:joso_app/homepage.dart';
import 'package:joso_app/housekeeperadd.dart';
import 'package:joso_app/joso.dart';
import 'package:joso_app/login.dart';
import 'package:joso_app/partime1.dart';
import 'package:joso_app/profile.dart';
import 'package:joso_app/register.dart';
import 'package:joso_app/tutoradd.dart';
import 'package:joso_app/vol1.dart';
import 'package:joso_app/voluntaryadd.dart';
//import 'package:joso_app/email_verification.dart';


import 'firebase_options.dart';

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
      'vol1': (context) => const Myvol1(),
      'partime1': (context) => const MyPartime1(),
      'cook': (context) => const Mycook(),
      'Tutor': (context) => const Mytutor(),
      'Housekeeper': (context) => const Myhousekeeper(),
      'caterer': (context) => const Mycaterer(),
      'driver': (context) => const Mydriver(),
      // 'cookadd': (context) => Mycookadd(),
      'cookapply': (context) => const Mycookapply(),
      'frontprofile': (context) => const Myfrontprofile(),
      'profile': (context) => const Myprofile(),
      'tutoradd': (context) => const Mytutoradd(),
      'housekeeperadd': (context) => const Myhousekeeperadd(),
      'catereradd': (context) => const Mycatereradd(),
      'driveradd': (context) => const Mydriveradd(),
      'voluntaryadd': (context) => const Myvoluntaryadd(),
      //'email_verification': (context) => EmailVerificationPage(),
    },
  ));
}
