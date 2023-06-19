import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Myvol1 extends StatefulWidget {
  const Myvol1({Key? key}) : super(key: key);

  @override
  State<Myvol1> createState() => _Myvol1State();
}

class _Myvol1State extends State<Myvol1> {
  final _userStream =
      FirebaseFirestore.instance.collection('voluntaryvacant').snapshots();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(5),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 234, 234, 234),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
            backgroundColor: Color.fromARGB(255, 1, 0, 27),
            title: const Text(
              'voluntary services',
            ),
            // Empty SizedBox to remove the title text
            actions: <Widget>[
              IconButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const SearchPage()),
                ),
                icon: const Icon(Icons.search),
                iconSize: 25,
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            StreamBuilder(
              stream: _userStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Connection error');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Loading...');
                }
                var docs = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      onDismissed: (_) async {
                        var i = docs[index];
                        await FirebaseFirestore.instance
                            .collection('voluntaryvacant')
                            .doc(i.id)
                            .delete();

                        docs.removeAt(index);
                      },
                      background: Container(
                        color: Colors.red,
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        alignment: Alignment.centerRight,
                        child: const Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      child: ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(
                          docs[index]['Name'],
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(docs[index]['place']),
                            Text(docs[index]['duration']),
                            Text(docs[index]['comments']),
                            Divider(),
                          ],
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'cookapply');
                          },
                          child: Text(
                            'apply',
                            style: TextStyle(
                              color: Color.fromARGB(255, 252, 251, 251),
                            ),
                            textAlign: TextAlign.end,
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 1, 0, 27)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(
                                  color: Color.fromARGB(255, 1, 0, 0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'voluntaryadd');
                  },
                  child: const Icon(Icons.add),
                  backgroundColor: Color.fromARGB(255, 1, 0, 27)),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 0, 27),
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  color: Colors.black,
                  onPressed: () {
                    /* Clear the search field */
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Myvol1 extends StatefulWidget {
//   const Myvol1({super.key});

//   @override
//   State<Myvol1> createState() => _Myvol1State();
// }

// class _Myvol1State extends State<Myvol1> {
//   final _userStream =
//       FirebaseFirestore.instance.collection('voluntaryvacant').snapshots();
//   @override
//   Widget build(BuildContext context) {
//     {
//       return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(50),
//           child: AppBar(
//               backgroundColor: Color.fromARGB(255, 0, 0, 0),
//               title: const Text(
//                 'voluntary services',
//               ),
//               centerTitle: true,
//               actions: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(right: 10),
//                   child: IconButton(
//                     onPressed: () => Navigator.of(context).push(
//                         MaterialPageRoute(builder: (_) => const SearchPage())),
//                     icon: const Icon(Icons.search),
//                     iconSize: 25,
//                   ),
//                 ),
//                 // IconButton(
//                 //   icon: const Icon(
//                 //     Icons.add_box,
//                 //     color: Colors.white,
//                 //   ),
//                 //   onPressed: () {
//                 //     Navigator.pushNamed(context, 'voluntaryadd');
//                 //     // do something
//                 //   },
//                 // )
//               ]),
//         ),
//         body: StreamBuilder(
//             stream: _userStream,
//             builder: (context, snapshot) {
//               if (snapshot.hasError) {
//                 return const Text('connection error');
//               }
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Text('Loading...');
//               }
//               var docs = snapshot.data!.docs;
//               //return Text('${docs.length}');
//               return ListView.builder(
//                   itemCount: docs.length,
//                   itemBuilder: (context, index) {
//                     return Dismissible(
//                         key: UniqueKey(),
//                         direction: DismissDirection.endToStart,
//                         onDismissed: (_) async {
//                           var i = docs[index];
//                           await FirebaseFirestore.instance
//                               .collection('voluntaryvacant')
//                               .doc(i.id)
//                               .delete();

//                           docs.removeAt(index);
//                         },
//                         background: Container(
//                           color: Colors.red,
//                           margin: const EdgeInsets.symmetric(horizontal: 15),
//                           alignment: Alignment.centerRight,
//                           child: const Icon(
//                             Icons.delete,
//                             color: Colors.white,
//                           ),
//                         ),
//                         child: ListTile(
//                           leading: const Icon(Icons.person),
//                           title: Text(
//                             docs[index]['Name'],
//                             style: TextStyle(
//                                 fontSize: 18,
//                                 color: Colors.black87,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           subtitle: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 docs[index]['place'],
//                               ),
//                               Text(docs[index]['duration']),
//                               Text(docs[index]['comments']),
//                               Divider(),
//                             ],
//                           ),
//                           trailing: ElevatedButton(
//                               onPressed: () {
//                                 (() {
//                                   Navigator.pushNamed(context, 'cookapply');
//                                 });
//                               },
//                               child: Text(
//                                 'apply',
//                                 style: TextStyle(
//                                   color: Color.fromARGB(255, 252, 251, 251),
//                                 ),
//                                 textAlign: TextAlign.end,
//                               ),
//                               style: ButtonStyle(
//                                   backgroundColor: MaterialStatePropertyAll(
//                                       Color.fromARGB(255, 2, 0, 0)),
//                                   shape: MaterialStateProperty.all<
//                                           RoundedRectangleBorder>(
//                                       RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(18.0),
//                                           side: BorderSide(
//                                             color: Color.fromARGB(255, 1, 0, 0),
//                                           ))))),
//                         ));
//                   });
//             }),
//       );
//     }
//   }
// }

// class SearchPage extends StatelessWidget {
//   const SearchPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         // decoration: BoxDecoration(
//         //     image: DecorationImage(
//         //         image: const AssetImage('assets/images/NEEDAJOB.png'),
//         //         fit: BoxFit.fill,
//         //         colorFilter: ColorFilter.mode(
//         //             const Color.fromARGB(255, 245, 241, 244).withOpacity(0.2),
//         //             BlendMode.modulate))),
//         child: Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//           backgroundColor: const Color.fromARGB(255, 1, 0, 27),
//           // The search area here
//           title: Container(
//             width: double.infinity,
//             height: 40,
//             decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 255, 255, 255),
//                 borderRadius: BorderRadius.circular(5)),
//             child: Center(
//               child: TextField(
//                 decoration: InputDecoration(
//                     prefixIcon: const Icon(
//                       Icons.search,
//                       color: Colors.black,
//                     ),
//                     suffixIcon: IconButton(
//                       icon: const Icon(Icons.clear),
//                       color: Colors.black,
//                       onPressed: () {
//                         /* Clear the search field */
//                       },
//                     ),
//                     hintText: 'Search...',
//                     border: InputBorder.none),
//               ),
//             ),
//           )),
//     ));
//   }
// }
