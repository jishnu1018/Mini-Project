import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Myfrontprofile extends StatefulWidget {
  const Myfrontprofile({Key? key}) : super(key: key);

  @override
  State<Myfrontprofile> createState() => _MyfrontprofileState();
}

class _MyfrontprofileState extends State<Myfrontprofile> {
  final usernamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final aboutmecontroller = TextEditingController();
  final experiencecontroller = TextEditingController();
  @override
  void initState() {
    // getstudent1();
    super.initState();
    getstudent1();
  }

  // final usernamecontroller = TextEditingController();
  // final emailcontroller = TextEditingController();
  // //final aboutmecontroller = TextEditingController();
  //final experiencecontroller = TextEditingController();
  String username = "";
  String aboutme = "";
  String experience = "";
  String image = "";
  getstudent1() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      image = (snap.data() as Map<String, dynamic>)["imageLink"];

      usernamecontroller.text = (snap.data() as Map<String, dynamic>)['Name'];
      emailcontroller.text = (snap.data() as Map<String, dynamic>)['Email'];
      aboutmecontroller.text =
          (snap.data() as Map<String, dynamic>)['About me'];
      experiencecontroller.text =
          (snap.data() as Map<String, dynamic>)['Experience'];
      // (snap.data() as Map<String, dynamic>)['Experience'];
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                image == ""
                    ? CircleAvatar(
                        radius: 50,
                      )
                    : CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(image),
                      )
              ],
            ),
            IconButton(
              icon: const Icon(
                Icons.edit,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 30,
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'profile');
                // do something
              },
            ),
            // SizedBox(
            //   height: 50,
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 15),
              child: TextFormField(
                enabled: false,
                controller: usernamecontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    isDense: true,
                    contentPadding: EdgeInsets.all(14),
                    label: Text('Username'),
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
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 15),
              child: TextFormField(
                enabled: false,
                controller: emailcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    isDense: true,
                    contentPadding: EdgeInsets.all(14),
                    label: Text('Email'),
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
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 15),
              child: TextFormField(
                enabled: false,
                controller: aboutmecontroller,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.book),
                    isDense: true,
                    contentPadding: EdgeInsets.all(14),
                    label: Text('About me'),
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
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 15),
              child: TextFormField(
                enabled: false,
                controller: experiencecontroller,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.comment),
                    isDense: true,
                    contentPadding: EdgeInsets.all(14),
                    label: Text('Experience'),
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
            ),
            // Text(username),
            // Text(aboutme), Text(experience),

            // Container(
            //   // height: screenHeight * 0.3, // Adjust the height of the first rectangle here
            //   // color: Color.fromARGB(255, 1, 0, 27),
            //   // padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.all(20.0),
            //         child: Container(
            //           width: 120,
            //           height: 200,
            //           decoration: const BoxDecoration(
            //             shape: BoxShape.circle,
            //             color: Color.fromARGB(255, 49, 39, 46),
            //           ),
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(10.0),
            //         child: Container(
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               // IconButton(
            //               //   icon: const Icon(
            //               //     Icons.notifications,
            //               //     color: Color.fromARGB(255, 0, 0, 0),
            //               //     size: 45,
            //               //   ),
            //               //   onPressed: () {
            //               //     Navigator.pushNamed(context, '');
            //               //     // do something
            //               //   },
            //               // ),
            //               const SizedBox(
            //                 height: 20,
            //               ),

            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // // ),
            // Container(
            //   height: screenHeight *
            //       0.6, // Adjust the height of the second rectangle here
            //   color: Colors.white,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       const SizedBox(
            //         height: 300,
            //       ),
            //       TextButton(
            //         onPressed: () {},
            //         child: Container(
            //           color: const Color.fromARGB(255, 1, 0, 27),
            //           padding: const EdgeInsets.symmetric(
            //             vertical: 20,
            //             horizontal: 60,
            //           ),
            //           child: const Text(
            //             'My Applications',
            //             style: TextStyle(
            //               color: Color.fromARGB(255, 252, 249, 249),
            //               fontSize: 20,
            //             ),
            //           ),
            //         ),
            //       ),

            //       // TextButton(
            //       //   onPressed: () {},
            //       //   child: Container(
            //       //     color: const Color.fromARGB(255, 1, 0, 27),
            //       //     padding: const EdgeInsets.symmetric(
            //       //       vertical: 20,
            //       //       horizontal: 72,
            //       //     ),
            //       //     child: const Text(
            //       //       'My Job posts',
            //       //       style: TextStyle(
            //       //         color: Color.fromARGB(255, 255, 252, 252),
            //       //         fontSize: 20,
            //       //       ),
            //       //     ),
            //       //   ),
            //       // ),
            //       // SizedBox(
            //       //   height: screenHeight * 0.2,
            //       // ),
            //       // Align(
            //       //   alignment: Alignment.bottomRight,
            //       //   child: CircleAvatar(
            //       //     radius: 30,
            //       //     backgroundColor: Color.fromARGB(255, 1, 0, 27),
            //       //     child: IconButton(
            //       //       onPressed: () {
            //       //         Navigator.pushNamed(context, 'choice');
            //       //       },
            //       //       icon: Icon(Icons.arrow_forward),
            //       //     ),
            //       //   ),
            //       // ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}





















// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get_navigation/get_navigation.dart';

// class Myfrontprofile extends StatefulWidget {
//   const Myfrontprofile({super.key});

//   @override
//   State<Myfrontprofile> createState() => _MyfrontprofileState();
// }

// class _MyfrontprofileState extends State<Myfrontprofile> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         // padding: const EdgeInsets.all(20),
//         // decoration: BoxDecoration(
//         //     image: DecorationImage(
//         //         image: AssetImage('assets/images/NEEDAJOB.png'),
//         //         fit: BoxFit.fill,
//         //         colorFilter: ColorFilter.mode(
//         //             Color.fromARGB(255, 248, 241, 246).withOpacity(0.2),
//         //             BlendMode.modulate))),
//         child: Scaffold(
//             backgroundColor: Colors.white,
//             body: Center(
//                 child: Column(children: [
//               Column(children: [
//                 Row(
//                   children: [
//                     Container(
//                       width: 150,
//                       height: 220,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Color.fromARGB(255, 49, 39, 46),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 29,
//                     ),
//                     Column(
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.notifications,
//                               color: Color.fromARGB(250, 98, 90, 90), size: 50),
//                           onPressed: () {
//                             Navigator.pushNamed(context, '');
//                             // do something
//                           },
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.edit,
//                               color: Color.fromARGB(250, 98, 90, 90), size: 50),
//                           onPressed: () {
//                             Navigator.pushNamed(context, 'profile');
//                             // do something
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 150,
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Container(
//                     color: Color.fromARGB(255, 49, 39, 46),
//                     padding: EdgeInsetsDirectional.symmetric(
//                         vertical: 25, horizontal: 90),
//                     child: Text(
//                       'My Applications',
//                       style: TextStyle(
//                           color: Color.fromARGB(255, 252, 249, 249),
//                           fontSize: 20),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Container(
//                     color: Color.fromARGB(255, 49, 39, 46),
//                     padding: EdgeInsetsDirectional.symmetric(
//                         vertical: 25, horizontal: 100),
//                     child: Text(
//                       'My Job posts',
//                       style: TextStyle(
//                           color: Color.fromARGB(255, 255, 252, 252),
//                           fontSize: 20),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 40,
//                 ),
//                 Align(
//                     alignment: Alignment.bottomRight,
//                     child: CircleAvatar(
//                       radius: 40,
//                       backgroundColor: Color.fromARGB(255, 49, 39, 46),
//                       child: IconButton(
//                           onPressed: () {
//                             Navigator.pushNamed(context, 'choice');
//                           },
//                           icon: Icon(Icons.arrow_forward)),
//                     ))
//               ])
//             ]))));
//   }
// }
