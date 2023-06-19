import 'package:flutter/material.dart';

class Myfrontprofile extends StatefulWidget {
  const Myfrontprofile({Key? key}) : super(key: key);

  @override
  State<Myfrontprofile> createState() => _MyfrontprofileState();
}

class _MyfrontprofileState extends State<Myfrontprofile> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            // height: screenHeight * 0.3, // Adjust the height of the first rectangle here
            // color: Color.fromARGB(255, 1, 0, 27),
            // padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: 120,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 49, 39, 46),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.notifications,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 45,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '');
                            // do something
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, 'profile');
                            // do something
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: screenHeight *
                0.6, // Adjust the height of the second rectangle here
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 300,
                ),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    color: Color.fromARGB(255, 1, 0, 27),
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 60,
                    ),
                    child: Text(
                      'My Applications',
                      style: TextStyle(
                        color: Color.fromARGB(255, 252, 249, 249),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),

                TextButton(
                  onPressed: () {},
                  child: Container(
                    color: Color.fromARGB(255, 1, 0, 27),
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 72,
                    ),
                    child: Text(
                      'My Job posts',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 252, 252),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: screenHeight * 0.2,
                // ),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: CircleAvatar(
                //     radius: 30,
                //     backgroundColor: Color.fromARGB(255, 1, 0, 27),
                //     child: IconButton(
                //       onPressed: () {
                //         Navigator.pushNamed(context, 'choice');
                //       },
                //       icon: Icon(Icons.arrow_forward),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
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
