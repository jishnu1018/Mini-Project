import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Myjoso extends StatefulWidget {
  const Myjoso({super.key});

  @override
  State<Myjoso> createState() => _MyjosoState();
}

class _MyjosoState extends State<Myjoso> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 1, 0, 27),
        body: SafeArea(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                height: 20,
              ),
              const Text(
                'JOSO',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 80,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Jobs and Social Services',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              // const Text(
              //   'Your solution is here',
              //   style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 15,
              //       fontWeight: FontWeight.w500),
              // ),
              const SizedBox(
                height: 140,
              ),
              Container(
                width: 300,
                height: 50,
                child: TextButton(
                    onPressed: () {
                      setState(() {});
                      Navigator.pushNamed(context, 'login');
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255))))),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              const SizedBox(height: 20),
              Container(
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: TextButton(
                      onPressed: () {
                        setState(() {});
                        Navigator.pushNamed(context, 'register');
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: const BorderSide(
                                      color: Color.fromARGB(
                                          255, 254, 253, 249))))),
                      child: const Text('Create an Account',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ))),
                ),
              ),
              const SizedBox(
                height: 290,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  'Discover Local Jobs and Services and Make a ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w800),
                ),
              ),
              const Text(
                'Difference in Your Community',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w800),
              )
            ]),
          ),
        ));
  }
}
