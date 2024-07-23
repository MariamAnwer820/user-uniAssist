import 'package:admin_interface22/screens/login.dart';
import 'package:flutter/material.dart';

class logout extends StatefulWidget {
  const logout({super.key});

  @override
  State<logout> createState() => _logoutState();
}

class _logoutState extends State<logout> {
  //signout function
  // signOut() async {

  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => login_page()));
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              toolbarHeight: 65,
              backgroundColor: Theme.of(context).colorScheme.primary,
              leading: IconButton(
                icon: Image.asset('image/0000.png'),
                onPressed: () {},
              ),
              title: Text(
                'Dashboard Screen',
                style: TextStyle(
                    fontFamily: 'Gabriela',
                    color: Theme.of(context).colorScheme.secondary),
              ),
              // actions: [
              //   IconButton(
              //     icon: Image.asset('image/6-01.png'),
              //     onPressed: () {},
              //   ),
              // ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 88,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        child: const CircleAvatar(
                          radius: 85,
                          backgroundImage: AssetImage('image/0000.png'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 20),
                        child: TextField(
                          onSubmitted: (value) {},
                          maxLength: 10,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  width: 1.5),
                            ),
                            filled: true,
                            fillColor: Theme.of(context).colorScheme.primary,
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                              color: Color(0xFFB7B7B7),
                              fontSize: 30,
                              fontFamily: 'Gabriela',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 0),
                        child: TextField(
                          onSubmitted: (value) {},
                          maxLength: 8,
                          obscureText: true,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  width: 1.5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  width: 1.5),
                            ),
                            filled: true,
                            fillColor: Theme.of(context).colorScheme.primary,
                            labelText: 'Confirm Password',
                            labelStyle: const TextStyle(
                              color: Color(0xFFB7B7B7),
                              fontSize: 30,
                              fontFamily: 'Gabriela',
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => login_page(),
                            ),
                            (route) => false,
                          );
                          //signOut();
                        },
                        style: ElevatedButton.styleFrom(
                            // ignore: deprecated_member_use
                            backgroundColor: const Color(0xFF47AD95),
                            minimumSize: const Size(80, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            side: const BorderSide(
                              width: 1.5,
                              color: Colors.white,
                            )),
                        child: const Text(
                          'Logout ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Gabriela'),
                        ),
                      )
                    ]),
              ),
            )));
  }
}
