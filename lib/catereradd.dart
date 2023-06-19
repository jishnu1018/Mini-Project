import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Mycatereradd extends StatefulWidget {
  const Mycatereradd({super.key});

  @override
  State<Mycatereradd> createState() => _MycatereraddState();
}

class _MycatereraddState extends State<Mycatereradd> {
  TextEditingController Name = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController duration = TextEditingController();
  TextEditingController comments = TextEditingController();
  final _text = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    Name.dispose();
    place.dispose();
    duration.dispose();
    comments.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 0, 27),
        title: Text('ADD A VACANCY'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
          right: 35,
          left: 35,
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              controller: Name,
              decoration: InputDecoration(
                hintText: 'Name',
                errorText: _validate ? 'Value Can\'t Be Empty' : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: place,
              decoration: InputDecoration(
                hintText: 'place',
                errorText: _validate ? 'Value Can\'t Be Empty' : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: duration,
              decoration: InputDecoration(
                hintText: 'duration',
                errorText: _validate ? 'Value Can\'t Be Empty' : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: TextField(
                controller: comments,
                decoration: InputDecoration(
                  hintText: 'comments',
                  errorText: _validate ? 'Value Can\'t Be Empty' : null,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 60, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              width: 175,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (Name.text.isEmpty ||
                        place.text.isEmpty ||
                        duration.text.isEmpty ||
                        comments.text.isEmpty) {
                      _validate = true;
                    } else {
                      _validate = false;
                      Map<String, dynamic> data = {
                        'Name': Name.text,
                        'place': place.text,
                        'duration': duration.text,
                        'comments': comments.text,
                      };
                      FirebaseFirestore.instance
                          .collection("caterervacant")
                          .add(data);
                      Navigator.of(context).pushNamed('caterer');
                    }
                  });
                },
                child: Text(
                  'Post the job',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 230, 229, 227),
                    backgroundColor: Color.fromARGB(255, 1, 0, 27),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color.fromARGB(255, 1, 0, 27)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Color.fromARGB(255, 1, 0, 27)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





//   @override
//   void dispose() {
//     _text.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color.fromARGB(255, 88, 13, 75),
//           title: Text('ADD A VACANCY'),
//         ),
//         body: SingleChildScrollView(
//           padding: EdgeInsets.only(
//               top: MediaQuery.of(context).size.height * 0.02,
//               right: 35,
//               left: 35),
//           child: Column(children: [
//             SizedBox(height: 20),
//             TextField(
//                 controller: Name,
//                 decoration: InputDecoration(
//                     hintText: 'Name',
//                     errorText: _validate ? 'Value Can\'t Be Empty' : null,
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)))),
//             SizedBox(height: 20),
//             TextField(
//               controller: place,
//               decoration: InputDecoration(
//                   hintText: 'place',
//                   errorText: _validate ? 'Value Can\'t Be Empty' : null,
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10))),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: duration,
//               decoration: InputDecoration(
//                   hintText: 'duration',
//                   errorText: _validate ? 'Value Can\'t Be Empty' : null,
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10))),
//             ),
//             SizedBox(height: 20),
//             SizedBox(
//               height: 300,
//               child: TextField(
//                 controller: comments,
//                 decoration: InputDecoration(
//                     hintText: 'comments',
//                     errorText: _validate ? 'Value Can\'t Be Empty' : null,
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 60, horizontal: 10),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10))),
//               ),
//             ),
//             SizedBox(
//               width: 5,
//               height: 0.1,
//             ),
//             TextButton(
//                 onPressed: () {
//                   _text.text.isEmpty ? _validate = true : _validate = false;
//                   Map<String, dynamic> data = {
//                     'Name': Name.text,
//                     'place': place.text,
//                     'duration': duration.text,
//                     'comments': comments.text,
//                   };
//                   FirebaseFirestore.instance
//                       .collection("caterervacant")
//                       .add(data);
//                   ({Navigator.of(context).pushNamed('caterer')});
//                 },
//                 child: Text(
//                   'Post the job',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 230, 229, 227),
//                     backgroundColor: Color.fromARGB(255, 88, 13, 75),
//                   ),
//                 ),
//                 style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(
//                       Color.fromARGB(255, 88, 13, 75),
//                     ),
//                     shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         side: BorderSide(
//                             color: Color.fromARGB(255, 114, 33, 136)))))),
//           ]),
//         ));
//   }
// }
