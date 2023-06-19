import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joso_app/bottomnav.dart';

class MyPartime1 extends StatefulWidget {
  const MyPartime1({super.key});

  @override
  State<MyPartime1> createState() => _MyPartime1State();
}

class _MyPartime1State extends State<MyPartime1> {
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
          backgroundColor: const Color.fromARGB(255, 1, 0, 27),
          title: Text(
            'JOB SECTORS',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontStyle: FontStyle.italic,
            ),
          ),
          // actions: <Widget>[
          //   Padding(
          //     padding: const EdgeInsets.only(right: 18.0),
          //     child: IconButton(
          //         onPressed: () => Navigator.of(context).push(
          //             MaterialPageRoute(builder: (_) => const SearchPage())),
          //         icon: const Icon(Icons.search),
          //         iconSize: 25),
          //   ),
          // ],

          // Navigate to the Search Screen
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (ct)=>Bottomnav()));
                    },
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/cook.png'),
                                  fit: BoxFit.fill)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            color: Colors.black,
                          ),
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 95,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Text(
                                    'COOK',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Icon(
                                  Icons.arrow_circle_right_outlined,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'Tutor');
                    },
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/tutor.png'),
                                  fit: BoxFit.fill)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                              color: Colors.black),
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 95,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Text(
                                    'TUTOR',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Icon(
                                  Icons.arrow_circle_right_outlined,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'Housekeeper');
                    },
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/house.png'),
                                  fit: BoxFit.fill)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Colors.black),
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 95,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Text(
                                    'HOUSE KEEPER',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Icon(
                                  Icons.arrow_circle_right_outlined,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'caterer');
                    },
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/caterer.png'),
                                  fit: BoxFit.fill)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Colors.black),
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 95,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Text(
                                    'CATERER',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Icon(
                                  Icons.arrow_circle_right_outlined,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'driver');
                    },
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/driver.png'),
                                  fit: BoxFit.fill)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Colors.black),
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 95,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Text(
                                    'DRIVER',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Icon(
                                  Icons.arrow_circle_right_outlined,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}

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

 // IconButton(
            //   icon: Icon(
            //     Icons.add_box,
            //     color: Color.fromARGB(255, 255, 255, 255),
            //     size: 30,
            //   ),
            //   onPressed: () {
            //     // do something
            //   },
            // ),







// Container(
                  //   decoration: BoxDecoration(
                  //       color: Colors.black,
                  //       borderRadius: BorderRadius.all(Radius.circular(20))),
                  //   // margin: const EdgeInsets.only(
                  //   //   top: 20.0,
                  //   // ),
                  //   padding: const EdgeInsets.all(10),
                  //   // color: const Color.fromARGB(255, 1, 0, 27),
                  //   height: 250,
                  //   width: 1000,
                  //   child: Column(
                  //     children: [
                  //       const Image(
                  //         image: AssetImage("assets/images/cook.png"),
                  //       ),
                  //       SizedBox(
                  //         height: 10,
                  //       ),
                  //       ElevatedButton(
                  //           onPressed: () {
                  //             setState(() {
                  //               Navigator.pushNamed(context, 'cook');
                  //             });
                  //           },
                  //           style: ButtonStyle(
                  //               backgroundColor: const MaterialStatePropertyAll(
                  //                   Color.fromARGB(255, 1, 0, 27)),
                  //               shape: MaterialStateProperty.all<
                  //                       RoundedRectangleBorder>(
                  //                   RoundedRectangleBorder(
                  //                       borderRadius:
                  //                           BorderRadius.circular(18.0),
                  //                       side: const BorderSide(
                  //                         color: Color.fromARGB(
                  //                             255, 255, 255, 255),
                  //                       )))),
                  //           child: const Text(
                  //             'Cook',
                  //             style: TextStyle(
                  //                 color: Color.fromARGB(255, 255, 255, 255),
                  //                 fontSize: 30,
                  //                 fontWeight: FontWeight.bold),
                  //             textAlign: TextAlign.end,
                  //           ))
                  //     ],
                  //   ),
                  // ),



 // Container(
                  //   margin: const EdgeInsets.only(
                  //     top: 20.0,
                  //   ),
                  //   padding: const EdgeInsets.all(10),
                  //   color: const Color.fromARGB(255, 1, 0, 27),
                  //   height: 280,
                  //   width: 1000,
                  //   child: Column(
                  //     children: [
                  //       const Image(
                  //         image: AssetImage("assets/images/tutor.png"),
                  //       ),
                  //       const SizedBox(
                  //         height: 30,
                  //         width: 1000,
                  //       ),
                  //       ElevatedButton(
                  //           onPressed: () {
                  //             setState(() {
                  //               Navigator.pushNamed(context, 'Tutor');
                  //             });
                  //           },
                  //           style: ButtonStyle(
                  //               backgroundColor: const MaterialStatePropertyAll(
                  //                   Color.fromARGB(255, 255, 255, 255)),
                  //               shape: MaterialStateProperty.all<
                  //                       RoundedRectangleBorder>(
                  //                   RoundedRectangleBorder(
                  //                       borderRadius:
                  //                           BorderRadius.circular(18.0),
                  //                       side: const BorderSide(
                  //                         color: Color.fromARGB(255, 0, 0, 0),
                  //                       )))),
                  //           child: const Text(
                  //             'Tutor',
                  //             style: TextStyle(
                  //                 color: Color.fromARGB(255, 1, 0, 27),
                  //                 fontSize: 30,
                  //                 fontWeight: FontWeight.bold),
                  //             textAlign: TextAlign.end,
                  //           ))
                  //     ],
                  //   ),
                  // ),


                  // Container(
                  //   margin: const EdgeInsets.only(
                  //     top: 20.0,
                  //   ),
                  //   padding: const EdgeInsets.all(10),
                  //   color: Color.fromARGB(255, 1, 0, 27),
                  //   height: 280,
                  //   width: 1000,
                  //   child: Column(
                  //     children: [
                  //       const Image(
                  //         image: AssetImage("assets/images/house.png"),
                  //       ),
                  //       const SizedBox(
                  //         height: 30,
                  //         width: 1000,
                  //       ),
                  //       ElevatedButton(
                  //           onPressed: () {
                  //             setState(() {
                  //               Navigator.pushNamed(context, 'Housekeeper');
                  //             });
                  //           },
                  //           style: ButtonStyle(
                  //               backgroundColor: const MaterialStatePropertyAll(
                  //                   Color.fromARGB(252, 255, 255, 255)),
                  //               shape: MaterialStateProperty.all<
                  //                       RoundedRectangleBorder>(
                  //                   RoundedRectangleBorder(
                  //                       borderRadius:
                  //                           BorderRadius.circular(18.0),
                  //                       side: const BorderSide(
                  //                         color: Color.fromARGB(255, 0, 0, 0),
                  //                       )))),
                  //           child: const Text(
                  //             'Housekeeper',
                  //             style: TextStyle(
                  //                 color: Color.fromARGB(255, 1, 0, 27),
                  //                 fontSize: 25,
                  //                 fontWeight: FontWeight.bold),
                  //             textAlign: TextAlign.end,
                  //           ))
                  //     ],
                  //   ),
                  // ),




                   // Container(
                  //   margin: const EdgeInsets.only(
                  //     top: 20.0,
                  //   ),
                  //   padding: const EdgeInsets.all(10),
                  //   color: const Color.fromARGB(255, 1, 0, 27),
                  //   height: 280,
                  //   width: 1000,
                  //   child: Column(
                  //     children: [
                  //       const Image(
                  //         image: AssetImage("assets/images/caterer.png"),
                  //       ),
                  //       const SizedBox(
                  //         height: 30,
                  //         width: 1000,
                  //       ),
                  //       ElevatedButton(
                  //           onPressed: () {
                  //             setState(() {
                  //               Navigator.pushNamed(context, 'caterer');
                  //             });
                  //           },
                  //           style: ButtonStyle(
                  //               backgroundColor: const MaterialStatePropertyAll(
                  //                   Color.fromARGB(252, 255, 255, 255)),
                  //               shape: MaterialStateProperty.all<
                  //                       RoundedRectangleBorder>(
                  //                   RoundedRectangleBorder(
                  //                       borderRadius:
                  //                           BorderRadius.circular(18.0),
                  //                       side: const BorderSide(
                  //                         color: Color.fromARGB(255, 0, 0, 0),
                  //                       )))),
                  //           child: const Text(
                  //             'caterer',
                  //             style: TextStyle(
                  //                 color: Color.fromARGB(255, 1, 0, 27),
                  //                 fontSize: 25,
                  //                 fontWeight: FontWeight.bold),
                  //             textAlign: TextAlign.end,
                  //           ))
                  //     ],
                  //   ),
                  // ),



  // Container(
                  //   margin: const EdgeInsets.only(
                  //     top: 20.0,
                  //   ),
                  //   padding: const EdgeInsets.all(10),
                  //   color: Color.fromARGB(255, 1, 0, 27),
                  //   height: 280,
                  //   width: 1000,
                  //   child: Column(
                  //     children: [
                  //       const Image(
                  //         image: AssetImage("assets/images/driver.png"),
                  //       ),
                  //       const SizedBox(
                  //         height: 30,
                  //         width: 1000,
                  //       ),
                  //       ElevatedButton(
                  //           onPressed: () {
                  //             setState(() {
                  //               Navigator.pushNamed(context, 'driver');
                  //             });
                  //           },
                  //           style: ButtonStyle(
                  //               backgroundColor: const MaterialStatePropertyAll(
                  //                   Color.fromARGB(252, 255, 255, 255)),
                  //               shape: MaterialStateProperty.all<
                  //                       RoundedRectangleBorder>(
                  //                   RoundedRectangleBorder(
                  //                       borderRadius:
                  //                           BorderRadius.circular(18.0),
                  //                       side: const BorderSide(
                  //                         color: Color.fromARGB(255, 0, 0, 0),
                  //                       )))),
                  //           child: const Text(
                  //             'driver',
                  //             style: TextStyle(
                  //                 color: Color.fromARGB(255, 1, 0, 27),
                  //                 fontSize: 25,
                  //                 fontWeight: FontWeight.bold),
                  //             textAlign: TextAlign.end,
                  //           ))
                  //     ],
                  //   ),
                  // ),