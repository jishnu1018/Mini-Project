import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  final _usernamecon = TextEditingController();
  final _emailcon = TextEditingController();
  final _biocon = TextEditingController();
  final _expcon = TextEditingController();
  static final _firebaseauth = FirebaseAuth.instance;

  File? _profileImage;
  void _updateDetails() {
    // Implement your update details logic here
    setState(() {});
  }

  Future<void> _pickProfilePicture(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _profileImage = File(pickedImage.path);
      });
    }
  }

  getdetails() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      _usernamecon.text = (snap.data() as Map<String, dynamic>)['username'];
      _emailcon.text = (snap.data() as Map<String, dynamic>)['email'];
      _biocon.text = (snap.data() as Map<String, dynamic>)['about me'];
      _expcon.text = (snap.data() as Map<String, dynamic>)['experience'];
    });
  }

  storedetails() async {
    print(FirebaseAuth.instance.currentUser!.uid);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_firebaseauth.currentUser!.uid)
        .update({
      'username': _usernamecon.text,
      'email': _emailcon.text,
      'about me': _biocon.text,
      'experience': _expcon.text
    });
    // DocumentSnapshot snap = await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(FirebaseAuth.instance.currentUser!.uid)
    //     .get();
    // setState(() {
    //   _usernamecon.text = (snap.data() as Map<String, dynamic>)['username'];
    //   _emailcon.text = (snap.data() as Map<String, dynamic>)['email'];
    //   _biocon.text = (snap.data() as Map<String, dynamic>)['about me'];
    //   _expcon.text = (snap.data() as Map<String, dynamic>)['eperience'];
    // });
    // ignore: use_build_context_synchronously
    //Navigator.pushNamed(context, 'frontprofile');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdetails();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Center(
            child: Column(children: [
          Column(children: [
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: const Icon(Icons.photo_library),
                            title: const Text('Choose from Gallery'),
                            onTap: () {
                              _pickProfilePicture(ImageSource.gallery);
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.camera_alt),
                            title: const Text('Take a Photo'),
                            onTap: () {
                              _pickProfilePicture(ImageSource.camera);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
//                   child: CircleAvatar(
//                     radius: 60.0,
//                     backgroundColor: Color.fromARGB(255, 136, 126, 126),
//                     backgroundImage: _profileImage != null
//                         ? FileImage(_profileImage!)
//                         : null,
//                     child: _profileImage == null
//                         ? const Icon(Icons.add_a_photo)
//                         : null,
//                   ),
//                 ),

                    radius: 50,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : const NetworkImage(
                            'https://via.placeholder.com/150',
                          ) as ImageProvider<Object>?,
                  ),
                  const SizedBox(height: 30),
                  // Text(
                  //   '',
                  //   style: const TextStyle(
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.white,
                  //   ),
                  // ),
                ],
              ),
            ),

            // Container(
            //   width: 100,
            //   height: 200,
            //   // decoration: const BoxDecoration(
            //   //   shape: BoxShape.circle,
            //   //   color: Color.fromARGB(255, 54, 49, 38),
            //   // ),
            //   padding: const EdgeInsets.only(top: 25),
            //   child: Column(children: [
            //     Container(
            //       width: 100.0,
            //       height: 120.0,
            //       decoration: const BoxDecoration(
            //         // image: DecorationImage(
            //         //     image: AssetImage('assets/images/profedit.png')),
            //         shape: BoxShape.circle,
            //         color: Color.fromARGB(255, 136, 126, 126),
            //       ),
            //     ),
            //     // IconButton(
            //     //   icon: const Icon(Icons.edit,
            //     //       color: Color.fromARGB(255, 73, 70, 70), size: 50),
            //     //   onPressed: () {
            //     //     // do something
            //     //   },
            //     // ),
            //   ]),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: _usernamecon,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                cursorColor: Color.fromARGB(255, 0, 0, 0),
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: '*Username',
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 12)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: _emailcon,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                cursorColor: Color.fromARGB(255, 0, 0, 0),
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: '*Email',
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 12)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: _biocon,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                cursorColor: Color.fromARGB(255, 0, 0, 0),
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: '*About me',
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 12)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: _expcon,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                cursorColor: Color.fromARGB(255, 0, 0, 0),
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: ' *Experiences',
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 12)),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            TextButton(
                onPressed: () {
                  storedetails();
                  setState(() {
                    Navigator.pushNamed(context, 'frontprofile');
                  });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 1, 0, 27),
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 1, 0, 27))))),
                child: const Text(
                  'SAVE',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                    backgroundColor: Color.fromARGB(255, 1, 0, 27),
                  ),
                )),
          ])
        ])));
  }
}







// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class Myprofile extends StatefulWidget {
//   const Myprofile({Key? key}) : super(key: key);

//   @override
//   State<Myprofile> createState() => _MyprofileState();
// }

// class _MyprofileState extends State<Myprofile> {
//   final TextEditingController _usernamecon = TextEditingController();
//   final TextEditingController _emailcon = TextEditingController();
//   final TextEditingController _biocon = TextEditingController();
//   final TextEditingController _expcon = TextEditingController();
//   static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   File? _profileImage;
//   final ImagePicker _imagePicker = ImagePicker();

//   Future<void> _selectFromGallery() async {
//     final pickedFile =
//         await _imagePicker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _profileImage = File(pickedFile.path);
//       });
//     }
//   }

//   Future<void> _captureFromCamera() async {
//     final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);
//     if (pickedFile != null) {
//       setState(() {
//         _profileImage = File(pickedFile.path);
//       });
//     }
//   }

//   getdetails() async {
//     DocumentSnapshot snap = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(_firebaseAuth.currentUser!.uid)
//         .get();
//     setState(() {
//       _usernamecon.text = (snap.data() as Map<String, dynamic>)['username'];
//       _emailcon.text = (snap.data() as Map<String, dynamic>)['email'];
//       _biocon.text = (snap.data() as Map<String, dynamic>)['about me'];
//       _expcon.text = (snap.data() as Map<String, dynamic>)['experience'];
//     });
//   }

//   storedetails() async {
//     print(_firebaseAuth.currentUser!.uid);
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(_firebaseAuth.currentUser!.uid)
//         .update({
//       'username': _usernamecon.text,
//       'email': _emailcon.text,
//       'about me': _biocon.text,
//       'experience': _expcon.text
//     });
//     Navigator.pushNamed(context, 'frontprofile');
//   }

//   @override
//   void initState() {
//     super.initState();
//     getdetails();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 255, 255, 255),
//       body: Center(
//         child: Column(
//           children: [
//             Column(
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           title: const Text('Select Image'),
//                           content: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               ListTile(
//                                 leading: const Icon(Icons.photo_library),
//                                 title: const Text('From Gallery'),
//                                 onTap: () {
//                                   Navigator.pop(context);
//                                   _selectFromGallery();
//                                 },
//                               ),
//                               ListTile(
//                                 leading: const Icon(Icons.camera_alt),
//                                 title: const Text('From Camera'),
//                                 onTap: () {
//                                   Navigator.pop(context);
//                                   _captureFromCamera();
//                                 },
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   },
//                   child: CircleAvatar(
//                     radius: 60.0,
//                     backgroundColor: Color.fromARGB(255, 136, 126, 126),
//                     backgroundImage: _profileImage != null
//                         ? FileImage(_profileImage!)
//                         : null,
//                     child: _profileImage == null
//                         ? const Icon(Icons.add_a_photo)
//                         : null,
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//                   child: TextFormField(
//                     controller: _usernamecon,
//                     style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
//                     cursorColor: Color.fromARGB(255, 0, 0, 0),
//                     decoration: const InputDecoration(
//                         border: UnderlineInputBorder(),
//                         labelText: '*Username',
//                         labelStyle: TextStyle(
//                             color: Color.fromARGB(255, 0, 0, 0), fontSize: 12)),
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//                   child: TextFormField(
//                     controller: _emailcon,
//                     style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
//                     cursorColor: Color.fromARGB(255, 0, 0, 0),
//                     decoration: const InputDecoration(
//                         border: UnderlineInputBorder(),
//                         labelText: '*Email',
//                         labelStyle: TextStyle(
//                             color: Color.fromARGB(255, 0, 0, 0), fontSize: 12)),
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//                   child: TextFormField(
//                     controller: _biocon,
//                     style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
//                     cursorColor: Color.fromARGB(255, 0, 0, 0),
//                     decoration: const InputDecoration(
//                         border: UnderlineInputBorder(),
//                         labelText: '*About me',
//                         labelStyle: TextStyle(
//                             color: Color.fromARGB(255, 0, 0, 0), fontSize: 12)),
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//                   child: TextFormField(
//                     controller: _expcon,
//                     style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
//                     cursorColor: Color.fromARGB(255, 0, 0, 0),
//                     decoration: const InputDecoration(
//                         border: UnderlineInputBorder(),
//                         labelText: ' *Experiences',
//                         labelStyle: TextStyle(
//                             color: Color.fromARGB(255, 0, 0, 0), fontSize: 12)),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 100,
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     storedetails();
//                   },
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(
//                       Color.fromARGB(255, 1, 0, 27),
//                     ),
//                     shape: MaterialStateProperty.all(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         side: const BorderSide(
//                           color: Color.fromARGB(255, 1, 0, 27),
//                         ),
//                       ),
//                     ),
//                   ),
//                   child: const Text(
//                     'SAVE',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Color.fromARGB(255, 255, 255, 255),
//                       backgroundColor: Color.fromARGB(255, 1, 0, 27),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }









