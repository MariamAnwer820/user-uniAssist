import 'package:admin_interface22/compontent/categorylevels.dart';
import 'package:admin_interface22/cubits/student_cubit/student_cubit.dart';
import 'package:admin_interface22/cubits/student_cubit/student_state.dart';
import 'package:admin_interface22/functions/snack_bar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class addstu extends StatefulWidget {
  const addstu({super.key});

  @override
  State<addstu> createState() => AddStuState();
}

class AddStuState extends State<addstu> {
  TextEditingController studentNameController = TextEditingController();
  TextEditingController studentEmailController = TextEditingController();
  TextEditingController studentPasswordController = TextEditingController();
  String dropdownvalue1 = '1';
  var items1 = ['1', '2', '3', '4'];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      body: BlocConsumer<StudentCubit, StudentState>(
        listener: (context, state) {
          if (state is AddStudentSuccessState) {
            showSnackBar(context, "Added Successfully");
            
          } else if (state is AddStudentErrorState) {
            showSnackBar(context,"Error try again");
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(7),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Theme.of(context).colorScheme.primary, // Updated to use surface color
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        categorylevel(
                          controller: studentNameController,
                          text: 'Student Name',
                          hinttext: 'Student name',
                          colorcon: Theme.of(context).colorScheme.primary,
                          validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }else if (value.length < 14) {
                              return 'Name must be at least 14 characters long';
                            }
                    return null;
                  },
                        ),
                        categorylevel(
                          controller: studentEmailController,
                          text: 'Student Email',
                          hinttext: 'Student email',
                          colorcon: Theme.of(context).colorScheme.primary,
                          validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                        ),
                        categorylevel(
                          controller: studentPasswordController,
                          text: 'Student Password',
                          hinttext: 'Student password',
                          colorcon: Theme.of(context).colorScheme.primary,
                          validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }else if (value.length < 14) {
                              return 'Password must be at least 14 characters long';
                            }
                    return null;
                  },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Student Level',
                              style: TextStyle(
                                fontFamily: 'Gabriela',
                                color: Color(0xFF47AD95),
                                fontSize: 23,
                              ),
                            ),
                            DropdownButton(
                              dropdownColor: Theme.of(context).colorScheme.primary,
                              elevation: 0,
                              value: dropdownvalue1,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              iconSize: 30,
                              underline: const SizedBox(),
                              items: items1.map((String items1) {
                                return DropdownMenuItem(
                                  value: items1,
                                  child: Text(
                                    items1,
                                    style: TextStyle(
                                      fontFamily: 'Gabriela',
                                      fontSize: 25,
                                      color: Theme.of(context).colorScheme.secondary,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue1 = newValue!;
                                });
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ConditionalBuilder(
                            condition: state is! AddStudentLoadingState,
                            builder: (context) => ElevatedButton(
                              onPressed: () {
                                
                                 if (_formKey.currentState?.validate() ?? false) {
                         BlocProvider.of<StudentCubit>(context).addStudent(
                                  studentName: studentNameController.text,
                                  studentEmail: studentEmailController.text,
                                  studentPassword: studentPasswordController.text,
                                  studentLevel: dropdownvalue1,
                                ); 
                       }          print("Student added successfully");
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:Color(0xFF47AD95) ,
                                minimumSize: const Size(100, 80),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                side: BorderSide(
                                  width: 1.5,
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              child: Text(
                                'ADD',
                                style: TextStyle(
                                  fontFamily: 'Gabriela',
                                  color: Theme.of(context).colorScheme.secondary,
                                  fontSize: 35,
                                ),
                              ),
                            ),
                            fallback: (context) => const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
