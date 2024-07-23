// ignore_for_file: unused_import
import 'package:admin_interface22/cubits/student_cubit/student_cubit.dart';
import 'package:admin_interface22/cubits/student_gr/student_gr_cubit.dart';
import 'package:admin_interface22/cubits/student_gr/student_gr_state.dart';
import 'package:admin_interface22/functions/snack_bar.dart';
import 'package:admin_interface22/screens/maintin_student/deleteall.dart';
import 'package:admin_interface22/screens/maintin_student/students/add_stu.dart';
import 'package:admin_interface22/screens/maintin_student/students/del_stu.dart';
import 'package:admin_interface22/screens/maintin_student/maintain_gr/maintin_gr.dart';
import 'package:admin_interface22/screens/maintin_student/view/view_stu.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:admin_interface22/compontent/category.dart';
import 'package:admin_interface22/screens/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(maintenance_student());
}

class maintenance_student extends StatefulWidget {
  @override
  State<maintenance_student> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<maintenance_student> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        'Maintenance Student Information',
                        style: TextStyle(
                            fontFamily: 'Gabriela',
                            fontSize: 18.2,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      category(
                          image: 'image/2-01.png',
                          text: "Delete Student",
                          fontSize: 16.9,
                          ontap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return delstu();
                            }));
                          },
                          colorcontainer: Theme.of(context).colorScheme.primary,
                          border1: Theme.of(context).colorScheme.secondary),
                      category(
                          image: 'image/5-01.png',
                          text: "Add Student",
                          fontSize: 16.9,
                          ontap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return addstu();
                            }));
                          },
                          colorcontainer: Theme.of(context).colorScheme.primary,
                          border1: Theme.of(context).colorScheme.secondary),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      category(
                          image: 'image/2-01.png',
                          text: "Delete level",
                          fontSize: 16.9,
                          ontap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Deleteall();
                            }));
                          },
                          colorcontainer: Theme.of(context).colorScheme.primary,
                          border1: Theme.of(context).colorScheme.secondary),
                      category(
                          image: 'image/research.png',
                          text: "View Students",
                          fontSize: 16.9,
                          ontap: () {
                            {
                              BlocProvider.of<StudentCubit>(context)
                                  .viewStudent();
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return view_stu();
                              }));
                            }
                            ;
                          },
                          colorcontainer: Theme.of(context).colorScheme.primary,
                          border1: Theme.of(context).colorScheme.secondary),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocConsumer<StudentGrCubit, StudentGRState>(
                        listener: (context, state) {
                          if (state is moveGRstudentSuccessState) {
                          showSnackBar(context, state.message);
                        } else if (state is moveGRstudentErrorState) {
                          showSnackBar(context, state.error);
                        }
                        },
                        builder: (context, state) {
                          return category(
                              image: 'image/move-right.png',
                              text: "Move Graduation Students",
                              fontSize: 15.4,
                              ontap: () {
                                BlocProvider.of<StudentGrCubit>(context)
                                    .moveGRstudent();
                              },
                              colorcontainer:
                                  Theme.of(context).colorScheme.primary,
                              border1: Theme.of(context).colorScheme.secondary);
                        },
                      ),
                      category(
                          image: 'image/graduate.png',
                          text: "maintenance Graduation Students",
                          fontSize: 15.7,
                          ontap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return maintenance_grstudent();
                            }));
                          },
                          colorcontainer: Theme.of(context).colorScheme.primary,
                          border1: Theme.of(context).colorScheme.secondary),
                    ],
                  )
                ],
              ),
            ),
          ),
    );
  }
}

