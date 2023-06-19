// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:joso_app/choice.dart';
// import 'services/auth_services.dart';

// class EmailVerificationPage extends StatefulWidget {
//   @override
//   _EmailVerificationPageState createState() => _EmailVerificationPageState();
// }

// class _EmailVerificationPageState extends State<EmailVerificationPage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   bool isemailverified = false;
//   Timer? timer;

//   @override
//   void initState() {
//     super.initState();
//     isemailverified = FirebaseAuth.instance.currentUser!.emailVerified;
//     if (!isemailverified) {
//       sendverificationemail();
//       timer = Timer.periodic(
//         const Duration(seconds: 3),
//         (_) => checkemailverified(),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }

//   Future checkemailverified() async {
//     await FirebaseAuth.instance.currentUser!.reload();
//     setState(() {
//       isemailverified = FirebaseAuth.instance.currentUser!.emailVerified;
//     });
//   }

//   Future sendverificationemail() async {
//     final user = FirebaseAuth.instance.currentUser!;
//     await user.sendEmailVerification();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isemailverified == true) {
//       setState(() {
//         Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>mychoice()));
//       });
//       // Get.to(() => const mychoice());
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Email Verification'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'An email verification link has been sent to your email address.',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 if (isemailverified = false) {
//                   // Email verified, navigate to the next screen
//                   Get.to(EmailVerificationPage());
//                 } else {
//                   showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                       title: const Text('Email Verification'),
//                       content: const Text(
//                         'Please verify your email address before proceeding.',
//                       ),
//                       actions: [
//                         TextButton(
//                           onPressed: () => Navigator.pop(context),
//                           child: const Text('OK'),
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//               },
//               child: const Text('Check Verification Status'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
