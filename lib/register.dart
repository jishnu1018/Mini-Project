import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:joso_app/choice.dart';
import 'package:joso_app/email_verification.dart';
import 'package:email_validator/email_validator.dart';

import 'services/auth_services.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  registerUser() async {
    String email = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (!EmailValidator.validate(email)) {
      Fluttertoast.showToast(msg: "Invalid email format");
      return;
    }

    if (password.length < 7) {
      Fluttertoast.showToast(
          msg: "Password should be at least 7 characters long");
      return;
    }

    String res = await AuthServices.register(email: email, password: password);
    if (res != "success") {
      // Error occurred during registration
      print(res);
      return;
    } else {
      Get.to(() => const mychoice());
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
              'Create Account',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 33,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.35,
                      right: 35,
                      left: 35),
                  child: Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _usernameController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
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
                                  registerUser();
                                }
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: const BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Sign up',
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
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}








// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:joso_app/choice.dart';
// import 'package:joso_app/email_verification.dart';
// import 'package:email_validator/email_validator.dart';

// import 'services/auth_services.dart';

// class MyRegister extends StatefulWidget {
//   const MyRegister({super.key});

//   @override
//   State<MyRegister> createState() => _MyRegisterState();
// }

// class _MyRegisterState extends State<MyRegister> {
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   registerUser() async {
//     String email = _usernameController.text.trim();
//     String password = _passwordController.text.trim();

//     if (!EmailValidator.validate(email)) {
//       Fluttertoast.showToast(msg: "Invalid email format");
//       return;
//     }

//     if (password.length < 7) {
//       Fluttertoast.showToast(
//           msg: "Password should be at least 7 characters long");
//       return;
//     }

//     String res = await AuthServices.register(email: email, password: password);
//     if (res != "success") {
//       // ignore: avoid_print
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
//               'Create Account',
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 33,
//                   fontWeight: FontWeight.w700),
//             ),
//           ),
//           SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   padding: EdgeInsets.only(
//                       top: MediaQuery.of(context).size.height * 0.35,
//                       right: 35,
//                       left: 35),
//                   child: Column(children: [
//                     TextField(
//                       keyboardType: TextInputType.emailAddress,
//                       controller: _usernameController,
//                       decoration: InputDecoration(
//                           fillColor: Colors.white,
//                           filled: true,
//                           hintText: 'Email',
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10))),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     TextField(
//                       keyboardType: TextInputType.text,
//                       controller: _passwordController,
//                       obscureText: true,
//                       decoration: InputDecoration(
//                           fillColor: Colors.white,
//                           filled: true,
//                           hintText: 'Password',
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10))),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
// // ignore: sized_box_for_whitespace
//                       Container(
//                         width: 180,
//                         height: 50,
//                         child: TextButton(
//                             onPressed: () {
//                               if (_usernameController.text.isEmpty) {
//                                 Fluttertoast.showToast(
//                                     msg: "Please enter username");
//                               } else if (_passwordController.text.isEmpty) {
//                                 Fluttertoast.showToast(
//                                     msg: "Please enter password");
//                               } else {
//                                 registerUser();
//                               }
//                             },
//                             style: ButtonStyle(
//                                 shape: MaterialStateProperty.all(
//                                     RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                         side: const BorderSide(
//                                             color: Color.fromARGB(
//                                                 255, 255, 255, 255))))),
//                             child: const Text(
//                               'Sign in',
//                               style: TextStyle(
//                                 color: Color.fromARGB(255, 255, 255, 255),
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             )),
//                       ),
//                     ]),
//                   ]),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
