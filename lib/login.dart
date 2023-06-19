import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:joso_app/choice.dart';
import 'package:joso_app/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  loginuser() async {
    String email = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Login successful
      Get.to(() => const mychoice());
    } catch (e) {
      // Login failed
      if (e is FirebaseAuthException && e.code == 'wrong-password') {
        // Invalid password
        Fluttertoast.showToast(msg: "Invalid password");
      } else {
        // Other login errors
        Fluttertoast.showToast(msg: "Login failed. Email is not registered");
      }
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 0, 27),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 40, top: 130),
            child: const Text(
              'Welcome Back',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.35,
                  right: 35,
                  left: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 3, right: 3),
                    child: Column(
                      children: [
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _usernameController,
                          decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 255, 255, 255),
                            filled: true,
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextField(
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          keyboardType: TextInputType.text,
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            fillColor: const Color.fromARGB(255, 255, 255, 255),
                            filled: true,
                            hintText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                // Implement forgot password logic
                              },
                              style: ButtonStyle(),
                              child: const Text(
                                'Forgot Password?',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Color.fromARGB(255, 102, 104, 110),
                                  fontSize: 15,
                                  
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 180,
                              height: 50,
                              child: TextButton(
                                onPressed: () {
                                  if (_usernameController.text.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: "Please enter username");
                                  } else if (_passwordController.text.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: "Please enter password");
                                  } else {
                                    loginuser();
                                  }
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



















// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:joso_app/choice.dart';
// import 'package:joso_app/register.dart';

// import 'package:joso_app/services/auth_services.dart';

// class MyLogin extends StatefulWidget {
//   const MyLogin({super.key});

//   @override
//   State<MyLogin> createState() => _MyLoginState();
// }

// class _MyLoginState extends State<MyLogin> {
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   void initstate() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   loginuser() async {
//     String email = _usernameController.text.trim();
//     String password = _passwordController.text.trim();
//     String res = await AuthServices.Login(email: email, password: password);
//     if (res != "success") {
//       print(res);
//       return;
//     } else {
//       Get.to(() => const mychoice());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 1, 0, 27),
//       body: Stack(
//         children: [
//           Container(
//             padding: const EdgeInsets.only(left: 40, top: 130),
//             child: const Text(
//               'Welcome Back',
//               style: TextStyle(color: Colors.white, fontSize: 40),
//             ),
//           ),
//           SingleChildScrollView(
//             child: Container(
//               padding: EdgeInsets.only(
//                   top: MediaQuery.of(context).size.height * 0.35,
//                   right: 35,
//                   left: 35),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.only(left: 3, right: 3),
//                     child: Column(
//                       children: [
//                         TextField(
//                           keyboardType: TextInputType.emailAddress,
//                           controller: _usernameController,
//                           // style: const TextStyle(
//                           //     color: Color.fromARGB(255, 0, 0, 0)),
//                           decoration: InputDecoration(
//                               fillColor: Color.fromARGB(255, 255, 255, 255),
//                               filled: true,
//                               hintText: "Email",
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               )),
//                         ),
//                         const SizedBox(
//                           height: 30,
//                         ),
//                         TextField(
//                           style: const TextStyle(
//                               color: Color.fromARGB(255, 0, 0, 0)),
//                           keyboardType: TextInputType.text,
//                           controller: _passwordController,
//                           obscureText: true,
//                           decoration: InputDecoration(
//                               fillColor:
//                                   const Color.fromARGB(255, 255, 255, 255),
//                               filled: true,
//                               hintText: 'Password',
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10))),
//                         ),
//                         Row(
//                           children: [
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.pushNamed(context, '');
//                               },
//                               style: const ButtonStyle(),
//                               child: const Text(
//                                 'Forgot Password?',
//                                 textAlign: TextAlign.left,
//                                 style: TextStyle(
//                                     decoration: TextDecoration.underline,
//                                     color: Color.fromARGB(255, 102, 104, 110),
//                                     fontSize: 15),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 30,
//                         ),
//                         Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Container(
//                                 width: 180,
//                                 height: 50,
//                                 child: TextButton(
//                                     onPressed: () {
//                                       if (_usernameController.text.isEmpty) {
//                                         Fluttertoast.showToast(
//                                             msg: "pls enter username");
//                                       } else if (_passwordController
//                                           .text.isEmpty) {
//                                         Fluttertoast.showToast(
//                                             msg: "pls enter password");
//                                       } else {
//                                         Navigator.of(context)
//                                             .pushNamed('choice');
//                                       }
//                                     },
//                                     style: ButtonStyle(
//                                         shape: MaterialStateProperty.all(
//                                             RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(15),
//                                                 side: const BorderSide(
//                                                     color: Color.fromARGB(
//                                                         255, 255, 255, 255))))),
//                                     child: const Text(
//                                       'Sign in',
//                                       style: TextStyle(
//                                         color:
//                                             Color.fromARGB(255, 255, 255, 255),
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     )),
//                               ),
//                             ]),
//                         const SizedBox(
//                           height: 40,
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
