import 'package:admin_interface22/compontent/theme_provider.dart';
import 'package:admin_interface22/screens/cons.dart';
import 'package:admin_interface22/screens/login.dart';
import 'package:admin_interface22/screens/maintainacademic/maintainACad.dart';
import 'package:admin_interface22/screens/maintin_student/maintan_student.dart';
import 'package:admin_interface22/screens/maintin_subject/maintan_subject.dart';
import 'package:admin_interface22/screens/uploadsfiles/upload%20files.dart';
import 'package:admin_interface22/screens/viewattendence/view_attendence.dart';
import 'package:admin_interface22/services/cache_services.dart';
import 'package:flutter/material.dart';
import 'package:admin_interface22/compontent/category.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(home_page());
}

class home_page extends StatefulWidget {
  @override
  State<home_page> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<home_page> {
  String? icon1 = is_dark ? 'image/6-01.png' : 'image/7-01.png';

  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
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
            actions: [
              IconButton(
                icon: Image.asset(icon1!),
                onPressed: () {
                  
                  setState(() {
                    Provider.of<themeprovider>(context, listen: false)
                        .toggoletheme();
                    is_dark
                        ? icon1 = "image/6-01.png"
                        : icon1 = 'image/7-01.png';
                  });
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //SizedBox(height: 70,),
                        // category(
                        //   image: 'image/11-01.png',
                        //   text: "Send Information",
                        //   fontSize: 16.9,
                        //   ontap: () {
                        //       Navigator.push(context,
                        //           MaterialPageRoute(builder: (context) {
                        //         return send_info();
                        //       }));
                        //     },
                        //     colorcontainer: Theme.of(context).colorScheme.primary,
                        //     border1:Theme.of(context).colorScheme.secondary
                        // ),

                        category(
                          image: 'image/1-01.png',
                          text: "View Attendance",
                          fontSize: 16.9,
                          ontap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return attendence();
                            }));
                          },
                          colorcontainer: Theme.of(context).colorScheme.primary,
                          border1: Theme.of(context).colorScheme.secondary,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        category(
                        image: 'image/13-01.png',
                        text: "Maintenance Academic stuff Information",
                        fontSize: 12.5,
                        ontap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return maintenanceStuff();
                          }));
                        },
                        colorcontainer: Theme.of(context).colorScheme.primary,
                        border1: Theme.of(context).colorScheme.secondary,
                      ),

                      SizedBox(
                        height: 30,
                      ),
                        category(
                          image: 'image/9-01.png',
                          text: "Maintenance Subject Information",
                          fontSize: 14.8,
                          ontap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return maintan_subject();
                            }));
                          },
                          colorcontainer: Theme.of(context).colorScheme.primary,
                          border1: Theme.of(context).colorScheme.secondary,
                        ),
                        
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // category(
                      //   image: 'image/12-01.png',
                      //   text: "View Schedule",
                      //   fontSize: 16.9,
                      //   ontap: () {
                      //       Navigator.push(context,
                      //           MaterialPageRoute(builder: (context) {
                      //         return view_schedule();
                      //       }));
                      //     },
                      //     colorcontainer: Theme.of(context).colorScheme.primary,
                      //     border1: Theme.of(context).colorScheme.secondary,
                      // ),

                      category(
                        image: 'image/13-01.png',
                        text: "Maintenance Student Information",
                        fontSize: 14.5,
                        ontap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return maintenance_student();
                          }));
                        },
                        colorcontainer: Theme.of(context).colorScheme.primary,
                        border1: Theme.of(context).colorScheme.secondary,
                      ),

                      SizedBox(
                        height: 30,
                      ),
                        category(
                        image: 'image/8-01.png',
                        text: "UPload files",
                        fontSize: 14.5,
                        ontap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return uploadfile();
                          }));
                        },
                        colorcontainer: Theme.of(context).colorScheme.primary,
                        border1: Theme.of(context).colorScheme.secondary,
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      category(
                        image: 'image/4-01.png',
                        text: "Logout",
                        fontSize: 16.9,
                        ontap: () {
                          CacheService.removeData(key: 'token');
                          print("$token is deleted");
                      Navigator.pushReplacement(context, 
                      MaterialPageRoute(builder: (context){
                        return login_page();
                      }
                      
                      ));
                        },
                        colorcontainer: Theme.of(context).colorScheme.primary,
                        border1: Theme.of(context).colorScheme.secondary,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
    return materialApp;
  }
}
