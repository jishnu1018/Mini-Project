import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:joso_app/tutorjobapply.dart';
//import 'package:joso_app/cookapply.dart';
//import 'package:joso_app/services/cookadd.dart';
//import 'package:joso_app/services/cookapply.dart';

class TutorOfferScreen extends StatefulWidget {
  TutorOfferScreen({super.key});

  @override
  State<TutorOfferScreen> createState() => _TutorOfferScreenState();
}

class _TutorOfferScreenState extends State<TutorOfferScreen> {
  final _userStream = FirebaseFirestore.instance
      .collection('tutorapply')
      .where('uid', isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 234, 234, 234),
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
          // backgroundColor: Color.fromARGB(255, 234, 234, 234),
          // appBar: PreferredSize(
          //     preferredSize: Size.fromHeight(50),
          //     child: AppBar(
          // flexibleSpace: Container(
          //     decoration: BoxDecoration(
          //         image: DecorationImage(
          //             image: AssetImage('assets/images/cook1.png'),
          //             fit: BoxFit.fill,
          //             colorFilter: ColorFilter.mode(
          //                 Color.fromARGB(255, 230, 216, 226)
          //                     .withOpacity(0.2),
          //                 BlendMode.modulate)))),
          backgroundColor: Color.fromARGB(255, 1, 0, 27),
          title: Text(
            'TUTOR',
            textAlign: TextAlign.center,
          ),
          // actions: <Widget>[
          //   IconButton(
          //     onPressed: () => Navigator.of(context).push(
          //       MaterialPageRoute(builder: (_) => const SearchPage()),
          //     ),
          //     icon: const Icon(Icons.search),
          //     iconSize: 25,
          //   ),
          // ]
        ),
        body: Stack(children: [
          StreamBuilder(
              stream: _userStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('connection error');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Loading...');
                }
                var docs = snapshot.data!.docs;
                //return Text('${docs.length}');
                return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      return Container(
                          key: UniqueKey(),
                          //direction: DismissDirection.endToStart,
                          // onDismissed: (_) async {
                          //   var i = docs[index];
                          //   FirebaseFirestore.instance
                          //       .collection('cookapply')
                          //       .doc(i.id)
                          //       .delete();

                          //   docs.removeAt(index);
                          // },
                          // background: Container(
                          //   color: Colors.red,
                          //   margin: const EdgeInsets.symmetric(horizontal: 15),
                          //   alignment: Alignment.centerRight,
                          //   child: const Icon(
                          //     Icons.delete,
                          //     color: Colors.white,
                          //   ),
                          // ),
                          child: ListTile(
                              leading: const Icon(Icons.person),
                              title: Text(
                                docs[index]['name'],
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    docs[index]['place'],
                                  ),
                                  Text(docs[index]['duration']),
                                  Text(docs[index]['comment']),
                                  Divider()
                                ],
                              ),
                              trailing: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Mytutorapply()),
                                    );
                                  },
                                  child: Text(
                                    'apply',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 252, 251, 251),
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color.fromARGB(255, 1, 0, 27)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                              side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 1, 0, 27),
                                              )))))));
                    });
              }),
          // Positioned(
          //   bottom: 16,
          //   right: 16,
          //   child: FloatingActionButton(
          //       onPressed: () {
          //         Navigator.of(context).push(
          //             MaterialPageRoute(builder: (context) => Mycookapply()));
          //       },
          //       child: const Icon(Icons.add),
          //       backgroundColor: Color.fromARGB(255, 1, 0, 27)),
          // ),
        ]));
  }
}

// class SearchPage extends StatelessWidget {
//   const SearchPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 1, 0, 27),
//         title: Container(
//           width: double.infinity,
//           height: 40,
//           decoration: BoxDecoration(
//             color: Color.fromARGB(255, 255, 255, 255),
//             borderRadius: BorderRadius.circular(5),
//           ),
//           child: Center(
//             child: TextField(
//               decoration: InputDecoration(
//                 prefixIcon: const Icon(
//                   Icons.search,
//                   color: Colors.black,
//                 ),
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.clear),
//                   color: Colors.black,
//                   onPressed: () {
//                     /* Clear the search field */
//                   },
//                 ),
//                 hintText: 'Search...',
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }






// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:joso_app/services/cookapply.dart';

// class OfferScreen extends StatefulWidget {
//   OfferScreen({Key? key}) : super(key: key);

//   @override
//   State<OfferScreen> createState() => _OfferScreenState();
// }

// class _OfferScreenState extends State<OfferScreen> {
//   final _userStream = FirebaseFirestore.instance
//       .collection('cookapply')
//       .where('uid', isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
//       .snapshots();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 234, 234, 234),
//       appBar: AppBar(
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 15.0),
//           child: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.arrow_back_ios),
//             iconSize: 20,
//           ),
//         ),
//         backgroundColor: Color.fromARGB(255, 1, 0, 27),
//         title: const Text(
//           'COOK',
//           textAlign: TextAlign.center,
//         ),
//         actions: <Widget>[
//           IconButton(
//             onPressed: () => Navigator.of(context).push(
//               MaterialPageRoute(builder: (_) => const SearchPage()),
//             ),
//             icon: const Icon(Icons.search),
//             iconSize: 25,
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           StreamBuilder(
//             stream: _userStream,
//             builder: (context, snapshot) {
//               if (snapshot.hasError) {
//                 return const Text('Connection error');
//               }
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Text('Loading...');
//               }
//               var docs = snapshot.data!.docs;
//               return ListView.builder(
//                 itemCount: docs.length,
//                 itemBuilder: (context, index) {
//                   return Dismissible(
//                     key: UniqueKey(),
//                     direction: DismissDirection.endToStart,
//                     confirmDismiss: (_) => showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           title: const Text('Confirm Deletion'),
//                           content: const Text(
//                             'Are you sure you want to delete this item?',
//                           ),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop(false);
//                               },
//                               child: const Text('Cancel'),
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop(true);
//                               },
//                               child: const Text('Delete'),
//                             ),
//                           ],
//                         );
//                       },
//                     ),
//                     onDismissed: (_) async {
//                       var shouldDelete = await showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AlertDialog(
//                             title: const Text('Confirm Deletion'),
//                             content: const Text(
//                               'Are you sure you want to delete this item?',
//                             ),
//                             actions: [
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.of(context).pop(false);
//                                 },
//                                 child: const Text('Cancel'),
//                               ),
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.of(context).pop(true);
//                                 },
//                                 child: const Text('Delete'),
//                               ),
//                             ],
//                           );
//                         },
//                       );

//                       if (shouldDelete == true) {
//                         var i = docs[index];
//                         await FirebaseFirestore.instance
//                             .collection('cookapply')
//                             .doc(i.id)
//                             .delete();
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('The item has been deleted.'),
//                           ),
//                         );
//                       }
//                     },
//                     background: Container(
//                       color: Colors.red,
//                       margin: const EdgeInsets.symmetric(horizontal: 15),
//                       alignment: Alignment.centerRight,
//                       child: const Icon(
//                         Icons.delete,
//                         color: Colors.white,
//                       ),
//                     ),
//                     child: ListTile(
//                       leading: const Icon(Icons.person),
//                       title: Text(
//                         docs[index]['name'],
//                         style: const TextStyle(
//                           fontSize: 18,
//                           color: Colors.black87,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(docs[index]['place']),
//                           Text(docs[index]['duration']),
//                           Text(docs[index]['comment']),
//                           const Divider(),
//                         ],
//                       ),
//                       trailing: ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             Navigator.pushNamed(context, 'cookapply');
//                           });
//                         },
//                         child: const Text(
//                           'apply',
//                           style: TextStyle(
//                             color: Color.fromARGB(255, 252, 251, 251),
//                           ),
//                           textAlign: TextAlign.end,
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color.fromARGB(255, 1, 0, 27),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(18.0),
//                             side: const BorderSide(
//                               color: Color.fromARGB(255, 1, 0, 27),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//           Positioned(
//             bottom: 16,
//             right: 16,
//             child: FloatingActionButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context) => CookApply()),
//                 );
//               },
//               child: const Icon(Icons.add),
//               backgroundColor: const Color.fromARGB(255, 1, 0, 27),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SearchPage extends StatelessWidget {
//   const SearchPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 1, 0, 27),
//         title: Container(
//           width: double.infinity,
//           height: 40,
//           decoration: BoxDecoration(
//             color: const Color.fromARGB(255, 255, 255, 255),
//             borderRadius: BorderRadius.circular(5),
//           ),
//           child: Center(
//             child: TextField(
//               decoration: InputDecoration(
//                 prefixIcon: const Icon(
//                   Icons.search,
//                   color: Colors.black,
//                 ),
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.clear),
//                   color: Colors.black,
//                   onPressed: () {
//                     /* Clear the search field */
//                   },
//                 ),
//                 hintText: 'Search...',
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
