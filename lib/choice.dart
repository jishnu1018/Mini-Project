import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:joso_app/email_verification.dart';
import 'package:joso_app/joso.dart';
import 'package:joso_app/securestorage.dart';
import 'package:joso_app/services/auth_services.dart';
import 'package:joso_app/voluntarybottomnav.dart';

// ignore: camel_case_types
class mychoice extends StatefulWidget {
  const mychoice({super.key});

  @override
  State<mychoice> createState() => _mychoiceState();
}

final secureStorage = SecureStorage();

class _mychoiceState extends State<mychoice> {
  get firebaseAuth => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 234, 234),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Builder(builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            }),
          ),
          backgroundColor: const Color.fromARGB(255, 1, 0, 27),
          centerTitle: true, // Align the title in the center
          title: const Padding(
            padding: EdgeInsets.only(top: 11.0),
            child: Text(
              "Select your choice",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
                fontSize: 23,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 1, 0, 27),
              ),
              child: Center(
                child: Text(
                  'JOSO',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 50,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(
                'Profile',
                style: TextStyle(
                    color: Color.fromARGB(255, 1, 0, 27),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () => {Navigator.pushNamed(context, 'frontprofile')},
            ),
            // ListTile(
            //   leading: const Icon(Icons.notifications),
            //   title: const Text(
            //     'Notifications',
            //     style: TextStyle(
            //         color: Color.fromARGB(255, 1, 0, 27),
            //         fontSize: 15,
            //         fontWeight: FontWeight.bold),
            //   ),
            //   onTap: () => {Navigator.of(context).pop()},
            // ),
            ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                      color: Color.fromARGB(255, 1, 0, 27),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: AlertDialog(
                            title: const Text(
                              'Do you want to Log Out?',
                              style: TextStyle(fontSize: 15),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancel')),
                              TextButton(
                                  onPressed: () async {
                                    secureStorage.deleteSecureData('email');
                                    final res = await AuthServices.signout();

                                    if (res == null) {
                                      Navigator.pop(context);
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Myjoso()));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(content: res));
                                    }
                                  },
                                  child: const Text('Log Out')),
                            ],
                          ),
                        );
                      });
                })
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 5, top: 30),
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    width: 343,
                    height: 230,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(60),
                      color: const Color.fromARGB(255, 1, 0, 27),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/volimg.png'),
                                  ),
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            const Expanded(
                              child: Text(
                                'Voluntary Services',
                                style: TextStyle(
                                  color: Color.fromARGB(225, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {});
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                Voluntarybottomnav())));
                                  },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              side: const BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255))))),
                                  child: const Text(
                                    'Select',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(20.0),
                            //   child: TextButton(
                            //     onPressed: () {
                            //       setState(() {
                            //         Navigator.pushNamed(context, 'vol1');
                            //       });
                            //     },
                            //     child: Container(
                            //       child: const Text(
                            //         'Select',
                            //         style: TextStyle(
                            //           fontSize: 20,
                            //           fontWeight: FontWeight.w900,
                            //           color:
                            //               Color.fromARGB(255, 255, 255, 255),
                            //           backgroundColor:
                            //               Color.fromARGB(255, 1, 0, 27),
                            //         ),
                            //       ),
                            //     ),
                            //     style: ButtonStyle(
                            //       backgroundColor: MaterialStateProperty.all(
                            //         Color.fromARGB(255, 1, 0, 27),
                            //       ),
                            //       shape: MaterialStateProperty.all(
                            //         RoundedRectangleBorder(

                            //           borderRadius: BorderRadius.circular(30),

                            //           side: BorderSide(
                            //               color:
                            //                   Color.fromARGB(255, 248, 240, 248)),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                width: 343,
                height: 230,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(60),
                  color: const Color.fromARGB(255, 1, 0, 27),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            width: 80.0,
                            height: 100.0,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/paid2.png'),
                              ),
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 251, 247, 247),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        const Expanded(
                          child: Text(
                            'Paid Jobs & \n Services',
                            style: TextStyle(
                              color: Color.fromARGB(221, 248, 245, 245),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: TextButton(
                              onPressed: () {
                                setState(() {});
                                Navigator.pushNamed(context, 'partime1');
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          side: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255))))),
                              child: const Text(
                                'Select',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(20.0),
                        //   child: TextButton(
                        //     onPressed: () {
                        //       setState(() {
                        //         Navigator.pushNamed(context, 'partime1');
                        //       });
                        //     },
                        //     child: const Text(
                        //       'Select',
                        //       style: TextStyle(
                        //         fontSize: 20,
                        //         fontWeight: FontWeight.w900,
                        //         color: Color.fromARGB(255, 0, 0, 0),
                        //         backgroundColor:
                        //             Color.fromARGB(255, 255, 255, 255),
                        //       ),
                        //     ),
                        //     style: ButtonStyle(
                        //       backgroundColor: MaterialStateProperty.all(
                        //         Color.fromARGB(255, 255, 255, 255),
                        //       ),
                        //       shape: MaterialStateProperty.all(
                        //         RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(30),
                        //           side: BorderSide(
                        //               color: Color.fromARGB(255, 1, 0, 1)),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}










// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:joso_app/email_verification.dart';

// // ignore: camel_case_types
// class mychoice extends StatefulWidget {
//   const mychoice({super.key});

//   @override
//   State<mychoice> createState() => _mychoiceState();
// }

// class _mychoiceState extends State<mychoice> {
//   get firebaseAuth => null;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(80),
//         child: AppBar(
//           backgroundColor: const Color.fromARGB(255, 1, 0, 27),
//           title: const Text(
//             "Select your choice",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Color.fromARGB(255, 255, 255, 255),
//               fontWeight: FontWeight.bold,
//               fontSize: 23,
//               fontStyle: FontStyle.italic,
//             ),
//           ),
//         ),
//       ),
//       drawer: Drawer(
//         child: Column(
//           children: <Widget>[
//             const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 1, 0, 27),
//               ),
//               child: Center(
//                 child: Text(
//                   'JOSO',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Color.fromARGB(255, 255, 255, 255),
//                     fontSize: 50,
//                   ),
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: const Icon(Icons.home),
//               title: const Text(
//                 'Profile',
//                 style: TextStyle(
//                     color: Color.fromARGB(255, 1, 0, 27),
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold),
//               ),
//               onTap: () => {Navigator.pushNamed(context, 'frontprofile')},
//             ),
//             ListTile(
//               leading: const Icon(Icons.notifications),
//               title: const Text(
//                 'Notifications',
//                 style: TextStyle(
//                     color: Color.fromARGB(255, 1, 0, 27),
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold),
//               ),
//               onTap: () => {Navigator.of(context).pop()},
//             ),
//             ListTile(
//               leading: const Icon(Icons.exit_to_app),
//               title: const Text(
//                 'Logout',
//                 style: TextStyle(
//                     color: Color.fromARGB(255, 1, 0, 27),
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold),
//               ),
//               onTap: () => {Navigator.pushNamed(context, 'joso')},
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.only(left: 5, top: 30),
//           child: Column(
//             children: [
//               Column(
//                 children: [
//                   const SizedBox(
//                     height: 50,
//                   ),
//                   Container(
//                     alignment: Alignment.center,
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
//                     width: 343,
//                     height: 230,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.rectangle,
//                       borderRadius: BorderRadius.circular(60),
//                       color: const Color.fromARGB(255, 1, 0, 27),
//                     ),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Expanded(
//                               child: Container(
//                                 width: 100.0,
//                                 height: 100.0,
//                                 decoration: const BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/volimg.png'),
//                                   ),
//                                   shape: BoxShape.circle,
//                                   color: Color.fromARGB(255, 255, 255, 255),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 25,
//                             ),
//                             const Expanded(
//                               child: Text(
//                                 'Voluntary Services',
//                                 style: TextStyle(
//                                   color: Color.fromARGB(225, 255, 255, 255),
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                   fontStyle: FontStyle.italic,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 28,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             SizedBox(
//                               width: 150,
//                               height: 50,
//                               child: TextButton(
//                                   onPressed: () {
//                                     setState(() {});
//                                     Navigator.pushNamed(context, 'vol1');
//                                   },
//                                   style: ButtonStyle(
//                                       shape: MaterialStateProperty.all(
//                                           RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(15),
//                                               side: const BorderSide(
//                                                   color: Color.fromARGB(
//                                                       255, 255, 255, 255))))),
//                                   child: const Text(
//                                     'Select',
//                                     style: TextStyle(
//                                       color:
//                                           Color.fromARGB(255, 255, 255, 255),
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   )),
//                             ),
//                             // Padding(
//                             //   padding: const EdgeInsets.all(20.0),
//                             //   child: TextButton(
//                             //     onPressed: () {
//                             //       setState(() {
//                             //         Navigator.pushNamed(context, 'vol1');
//                             //       });
//                             //     },
//                             //     child: Container(
//                             //       child: const Text(
//                             //         'Select',
//                             //         style: TextStyle(
//                             //           fontSize: 20,
//                             //           fontWeight: FontWeight.w900,
//                             //           color:
//                             //               Color.fromARGB(255, 255, 255, 255),
//                             //           backgroundColor:
//                             //               Color.fromARGB(255, 1, 0, 27),
//                             //         ),
//                             //       ),
//                             //     ),
//                             //     style: ButtonStyle(
//                             //       backgroundColor: MaterialStateProperty.all(
//                             //         Color.fromARGB(255, 1, 0, 27),
//                             //       ),
//                             //       shape: MaterialStateProperty.all(
//                             //         RoundedRectangleBorder(

//                             //           borderRadius: BorderRadius.circular(30),

//                             //           side: BorderSide(
//                             //               color:
//                             //                   Color.fromARGB(255, 248, 240, 248)),
//                             //         ),
//                             //       ),
//                             //     ),
//                             //   ),
//                             // ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 28,
//               ),
//               Container(
//                 alignment: Alignment.center,
//                 padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
//                 width: 343,
//                 height: 230,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.rectangle,
//                   borderRadius: BorderRadius.circular(60),
//                   color: const Color.fromARGB(255, 1, 0, 27),
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Expanded(
//                           child: Container(
//                             width: 80.0,
//                             height: 100.0,
//                             decoration: const BoxDecoration(
//                               image: DecorationImage(
//                                 image: AssetImage('assets/images/paid2.png'),
//                               ),
//                               shape: BoxShape.circle,
//                               color: Color.fromARGB(255, 251, 247, 247),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 25,
//                         ),
//                         const Expanded(
//                           child: Text(
//                             'Paid Jobs & \n Services',
//                             style: TextStyle(
//                               color: Color.fromARGB(221, 248, 245, 245),
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                               fontStyle: FontStyle.italic,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 28,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         SizedBox(
//                           width: 150,
//                           height: 50,
//                           child: TextButton(
//                               onPressed: () {
//                                 setState(() {});
//                                 Navigator.pushNamed(context, 'partime1');
//                               },
//                               style: ButtonStyle(
//                                   shape: MaterialStateProperty.all(
//                                       RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(15),
//                                           side: const BorderSide(
//                                               color: Color.fromARGB(
//                                                   255, 255, 255, 255))))),
//                               child: const Text(
//                                 'Select',
//                                 style: TextStyle(
//                                   color: Color.fromARGB(255, 255, 255, 255),
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               )),
//                         ),
//                         // Padding(
//                         //   padding: const EdgeInsets.all(20.0),
//                         //   child: TextButton(
//                         //     onPressed: () {
//                         //       setState(() {
//                         //         Navigator.pushNamed(context, 'partime1');
//                         //       });
//                         //     },
//                         //     child: const Text(
//                         //       'Select',
//                         //       style: TextStyle(
//                         //         fontSize: 20,
//                         //         fontWeight: FontWeight.w900,
//                         //         color: Color.fromARGB(255, 0, 0, 0),
//                         //         backgroundColor:
//                         //             Color.fromARGB(255, 255, 255, 255),
//                         //       ),
//                         //     ),
//                         //     style: ButtonStyle(
//                         //       backgroundColor: MaterialStateProperty.all(
//                         //         Color.fromARGB(255, 255, 255, 255),
//                         //       ),
//                         //       shape: MaterialStateProperty.all(
//                         //         RoundedRectangleBorder(
//                         //           borderRadius: BorderRadius.circular(30),
//                         //           side: BorderSide(
//                         //               color: Color.fromARGB(255, 1, 0, 1)),
//                         //         ),
//                         //       ),
//                         //     ),
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
