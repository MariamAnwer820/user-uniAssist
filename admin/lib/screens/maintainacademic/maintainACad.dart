// ignore_for_file: unused_import
import 'package:admin_interface22/cubits/student_gr/student_gr_cubit.dart';
import 'package:admin_interface22/cubits/stuff/stuff_cubit.dart';
import 'package:admin_interface22/screens/maintainacademic/addAcademic.dart';
import 'package:admin_interface22/screens/maintainacademic/delAcademic.dart';
import 'package:admin_interface22/screens/maintainacademic/viewAcd.dart';
import 'package:admin_interface22/screens/maintin_student/maintain_gr/add_gr.dart';
import 'package:admin_interface22/screens/maintin_student/maintain_gr/del_gr.dart';
import 'package:admin_interface22/screens/maintin_student/maintain_gr/view.dart';
import 'package:admin_interface22/screens/maintin_student/students/add_stu.dart';
import 'package:admin_interface22/screens/maintin_student/students/del_stu.dart';
import 'package:flutter/material.dart';
import 'package:admin_interface22/compontent/category.dart';
import 'package:admin_interface22/screens/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(maintenanceStuff());
}

class maintenanceStuff extends StatefulWidget {
  @override
  State<maintenanceStuff> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<maintenanceStuff> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: Container(
                          child: Image.asset('image/13-01.png'),
                        ),
                      ),
                      Text(
                        'Maintenance Academic Stuff Information',
                        style: TextStyle(
                            fontFamily: 'Gabriela',
                            fontSize: 12.2,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      category(
                          image: 'image/2-01.png',
                          text: "Delete Stuff",
                          fontSize: 16.9,
                          ontap: () {
                            /// BlocProvider.of<StuffCubit>(context).d;
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return delAcd();
                            }));
                          },
                          colorcontainer: Theme.of(context).colorScheme.primary,
                          border1: Theme.of(context).colorScheme.secondary),
                      category(
                          image: 'image/5-01.png',
                          text: "Add Stuff",
                          fontSize: 16.9,
                          ontap: () {
                             
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return addAcd();
                            }));
                          },
                          colorcontainer: Theme.of(context).colorScheme.primary,
                          border1: Theme.of(context).colorScheme.secondary),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      category(
                          image: 'image/research.png',
                          text: "View Academic Stuff",
                          fontSize: 15.4,
                          ontap: () {
                            BlocProvider.of<StuffCubit>(context).viewStuff();
                             Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return viewAcd();
                            }));
                          },
                          colorcontainer: Theme.of(context).colorScheme.primary,
                          border1: Theme.of(context).colorScheme.secondary),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
