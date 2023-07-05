import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Myvoluntaryapply extends StatefulWidget {
  const Myvoluntaryapply({super.key});

  @override
  State<Myvoluntaryapply> createState() => _MyvoluntaryapplyState();
}

class _MyvoluntaryapplyState extends State<Myvoluntaryapply> {
  TextEditingController Name = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController Mob_no = TextEditingController();
  TextEditingController comments = TextEditingController();
  final _text = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    Name.dispose();
    Address.dispose();
    email.dispose();
    Mob_no.dispose();
    comments.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
            iconSize: 20,
            //replace with our own icon data.
          ),
        ),
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
              keyboardType: TextInputType.name,
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
              controller: Address,
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                hintText: 'Address',
                errorText: _validate ? 'Value Can\'t Be Empty' : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
                errorText: _validate ? 'Value Can\'t Be Empty' : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: Mob_no,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Mob no',
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
                keyboardType: TextInputType.text,
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
                        Address.text.isEmpty ||
                        email.text.isEmpty ||
                        Mob_no.text.isEmpty ||
                        comments.text.isEmpty) {
                      _validate = true;
                    } else {
                      _validate = false;
                      Map<String, dynamic> data = {
                        'Name': Name.text,
                        'Address': Address.text,
                        'Email': email.text,
                        'Mob no': Mob_no.text,
                        'Comments': comments.text,
                      };
                      FirebaseFirestore.instance
                          .collection("voluntaryapplicant")
                          .add(data);
                      Navigator.pop(context);
                    }
                  });
                },
                child: Text(
                  'Apply',
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



// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Mycookapply extends StatefulWidget {
//   const Mycookapply({super.key});

//   @override
//   State<Mycookapply> createState() => _MycookapplyState();
// }

// class _MycookapplyState extends State<Mycookapply> {
//   TextEditingController Name = TextEditingController();
//   TextEditingController Address = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController Mob_no = TextEditingController();
//   TextEditingController comments = TextEditingController();
//   final _text = TextEditingController();
//   bool _validate = false;

//   @override
//   void dispose() {
//     _text.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color.fromARGB(255, 1, 0, 27),
//           title: Text('Apply for the job'),
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
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)))),
//             SizedBox(height: 20),
//             TextField(
//               controller: Address,
//               decoration: InputDecoration(
//                   hintText: 'Address',
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10))),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: email,
//               decoration: InputDecoration(
//                   hintText: 'email',
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10))),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: Mob_no,
//               decoration: InputDecoration(
//                   hintText: 'Mob no',
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
//                   Map<String, dynamic> data = {
//                     'Name': Name.text,
//                     'Adress': Address.text,
//                     'email': email.text,
//                     'Mob_no': Mob_no.text,
//                     'comments': comments.text,
//                   };
//                   FirebaseFirestore.instance
//                       .collection("cookapplicant")
//                       .add(data);
//                   ({Navigator.of(context).pushNamed('vol1')});
//                 },
//                 child: Text(
//                   'APPLY',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 230, 229, 227),
//                     backgroundColor: Color.fromARGB(255, 1, 0, 27),
//                   ),
//                 ),
//                 style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(
//                       Color.fromARGB(255, 1, 0, 27),
//                     ),
//                     shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         side: BorderSide(
//                             color: const Color.fromARGB(255, 1,0,27)))))),
//           ]),
//         ));
//   }
// }
