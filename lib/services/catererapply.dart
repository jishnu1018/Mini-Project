import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class catererApply extends StatefulWidget {
  const catererApply({super.key});

  @override
  State<catererApply> createState() => _catererApplyState();
}

class _catererApplyState extends State<catererApply> {
  final _namecon = TextEditingController();
  final _placecon = TextEditingController();
  final _duracon = TextEditingController();
  final _comcon = TextEditingController();
  final _datecon = TextEditingController();
  static final _firebaseauth = FirebaseAuth.instance;
  final _text = TextEditingController();
  bool _validate = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getdetails();
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

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
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _namecon,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      isDense: true,
                      contentPadding: const EdgeInsets.all(20),
                      label: const Text('Name'),
                      errorText: _validate ? 'Value Can\'t Be Empty' : null,
                      fillColor: const Color.fromARGB(120, 255, 255, 255),
                      filled: true,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255))),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220)))),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _placecon,
                  keyboardType: TextInputType.emailAddress,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.home),
                      isDense: true,
                      contentPadding: const EdgeInsets.all(20),
                      label: const Text('Place'),
                      errorText: _validate ? 'Value Can\'t Be Empty' : null,
                      fillColor: const Color.fromARGB(120, 255, 255, 255),
                      filled: true,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255))),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220)))),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _datecon,
                  keyboardType: TextInputType.datetime,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.dataset),
                      isDense: true,
                      contentPadding: const EdgeInsets.all(20),
                      label: const Text('Date'),
                      errorText: _validate ? 'Value Can\'t Be Empty' : null,
                      fillColor: const Color.fromARGB(120, 255, 255, 255),
                      filled: true,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255))),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220)))),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _duracon,
                  keyboardType: TextInputType.streetAddress,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_clock),
                      isDense: true,
                      contentPadding: const EdgeInsets.all(20),
                      label: const Text('Duration'),
                      errorText: _validate ? 'Value Can\'t Be Empty' : null,
                      fillColor: const Color.fromARGB(120, 255, 255, 255),
                      filled: true,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255))),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220)))),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _comcon,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.comment),
                      isDense: true,
                      contentPadding: const EdgeInsets.all(25),
                      label: const Text('Comments'),
                      errorText: _validate ? 'Value Can\'t Be Empty' : null,
                      fillColor: const Color.fromARGB(120, 255, 255, 255),
                      filled: true,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255))),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 64, 116, 220)))),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 1, 0, 27),
                  ),
                  onPressed: () async {
                    if (_namecon.text.isEmpty ||
                        _placecon.text.isEmpty ||
                        _datecon.text.isEmpty ||
                        _duracon.text.isEmpty ||
                        _comcon.text.isEmpty) {
                      setState(() {
                        _validate = true;
                      });
                    } else {
                      _validate = false;
                      Map<String, dynamic> data = {
                        'Name': _namecon.text,
                        'Place': _placecon.text,
                        'Date': _datecon.text,
                        'Duration': _duracon.text,
                        'Comments': _comcon.text,
                      };
                      Navigator.pop(context);
                      await FirebaseFirestore.instance
                          .collection('catererapply')
                          .doc()
                          .set(
                        {
                          "name": _namecon.text.trim(),
                          "place": _placecon.text.trim(),
                          "date": _datecon.text.trim(),
                          "duration": _duracon.text.trim(),
                          "comment": _comcon.text.trim(),
                          "uid": FirebaseAuth.instance.currentUser!.uid,
                        },
                      );
                    }
                    // await FirebaseFirestore.instance
                    //     .collection('voluntaryapply')
                    //     .doc()
                    //     .set(
                    //   {
                    //     "name": _namecon.text.trim(),
                    //     "place": _placecon.text.trim(),
                    //     "duration": _duracon.text.trim(),
                    //     "comment": _comcon.text.trim(),
                    //     "uid": FirebaseAuth.instance.currentUser!.uid,
                    //   },
                    // );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      width: 200,
                      child: const Text(
                        'UPLOAD',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


//   final _namecon = TextEditingController();
//   final _placecon = TextEditingController();
//   final _duracon = TextEditingController();
//   final _comcon = TextEditingController();
//   static final _firebaseauth = FirebaseAuth.instance;
//   final _text = TextEditingController();
//   bool _validate = false;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     //getdetails();
//   }

//   @override
//   void dispose() {
//     _text.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 30.0, right: 30),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 TextFormField(
//                   controller: _namecon,
//                   decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.person),
//                       isDense: true,
//                       contentPadding: EdgeInsets.all(20),
//                       label: Text('Name'),
//                       errorText: _validate ? 'Value Can\'t Be Empty' : null,
//                       fillColor: Color.fromARGB(120, 255, 255, 255),
//                       filled: true,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                           borderSide: BorderSide(
//                               color: Color.fromARGB(255, 255, 255, 255))),
//                       errorBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Color.fromARGB(255, 64, 116, 220))),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Color.fromARGB(255, 64, 116, 220)))),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 TextFormField(
//                   controller: _placecon,
//                   keyboardType: TextInputType.emailAddress,
//                   // ignore: prefer_const_constructors
//                   decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.home),
//                       isDense: true,
//                       contentPadding: const EdgeInsets.all(20),
//                       label: const Text('Place'),
//                       errorText: _validate ? 'Value Can\'t Be Empty' : null,
//                       fillColor: const Color.fromARGB(120, 255, 255, 255),
//                       filled: true,
//                       border: const OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                           borderSide: BorderSide(
//                               color: Color.fromARGB(255, 255, 255, 255))),
//                       errorBorder: const OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Color.fromARGB(255, 64, 116, 220))),
//                       focusedBorder: const OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Color.fromARGB(255, 64, 116, 220)))),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 TextFormField(
//                   controller: _duracon,
//                   keyboardType: TextInputType.streetAddress,
//                   // ignore: prefer_const_constructors
//                   decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.lock_clock),
//                       isDense: true,
//                       contentPadding: const EdgeInsets.all(20),
//                       label: const Text('Duration'),
//                       errorText: _validate ? 'Value Can\'t Be Empty' : null,
//                       fillColor: const Color.fromARGB(120, 255, 255, 255),
//                       filled: true,
//                       border: const OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                           borderSide: BorderSide(
//                               color: Color.fromARGB(255, 255, 255, 255))),
//                       errorBorder: const OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Color.fromARGB(255, 64, 116, 220))),
//                       focusedBorder: const OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Color.fromARGB(255, 64, 116, 220)))),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 TextFormField(
//                   controller: _comcon,
//                   decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.comment),
//                       isDense: true,
//                       contentPadding: EdgeInsets.all(25),
//                       label: Text('Comments'),
//                       errorText: _validate ? 'Value Can\'t Be Empty' : null,
//                       fillColor: Color.fromARGB(120, 255, 255, 255),
//                       filled: true,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                           borderSide: BorderSide(
//                               color: Color.fromARGB(255, 255, 255, 255))),
//                       errorBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Color.fromARGB(255, 64, 116, 220))),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Color.fromARGB(255, 64, 116, 220)))),
//                 ),
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 1, 0, 27),
//                   ),
//                   onPressed: () async {
//                     if (_namecon.text.isEmpty ||
//                         _placecon.text.isEmpty ||
//                         _duracon.text.isEmpty ||
//                         _comcon.text.isEmpty) {
//                       setState(() {
//                         _validate = true;
//                       });
//                     } else {
//                       _validate = false;
//                       Map<String, dynamic> data = {
//                         'Name': _namecon.text,
//                         'Place': _placecon.text,
//                         'Duration': _duracon.text,
//                         'Comments': _comcon.text,
//                       };
//                       Navigator.pop(context);
//                       await FirebaseFirestore.instance
//                           .collection('voluntaryapply')
//                           .doc()
//                           .set(
//                         {
//                           "name": _namecon.text.trim(),
//                           "place": _placecon.text.trim(),
//                           "duration": _duracon.text.trim(),
//                           "comment": _comcon.text.trim(),
//                           "uid": FirebaseAuth.instance.currentUser!.uid,
//                         },
//                       );
//                     }
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(6),
//                     child: Container(
//                       height: 40,
//                       alignment: Alignment.center,
//                       width: 200,
//                       child: const Text(
//                         'UPLOAD',
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
