import 'package:admin_interface22/compontent/categorylevels.dart';
import 'package:admin_interface22/cubits/student_gr/student_gr_cubit.dart';
import 'package:admin_interface22/cubits/student_gr/student_gr_state.dart';
import 'package:admin_interface22/functions/snack_bar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class addgr extends StatefulWidget {
  const addgr({super.key});

  @override
  State<addgr> createState() => addgrState();
}

class addgrState extends State<addgr> {
  TextEditingController studentNameController = TextEditingController();
  TextEditingController studentEmailController = TextEditingController();
  TextEditingController studentPasswordController = TextEditingController();
  TextEditingController studentRepeatPasswordController = TextEditingController();
  
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
                color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        body: BlocConsumer<StudentGrCubit, StudentGRState>(
          listener: (context, state) {
            if (state is AddStudentGRSuccessState) {
               
              showSnackBar(context, "Added Successfully");
              }
            
              else if(state is AddStudentGRErrorState){
                showSnackBar(context, "try again");
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
                child: Form(
                  key: _formKey ,
                  child: Column(
                                children: [
                  Container(
                    margin: const EdgeInsets.all(7),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Theme.of(context).colorScheme.primary,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 2,
                        )),
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
                    }else if (value.length < 15) {
                              return 'Name must be at least 15 characters long';
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
                        categorylevel(
                          controller: studentRepeatPasswordController,
                          text: 'Repeat Password',
                          hinttext: 'Repeat password',
                          colorcon: Theme.of(context).colorScheme.primary,
                          validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }else if (value!=studentPasswordController.text){
                      return 'Password do not match';
                    }
                    return null;
                  }, 
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ConditionalBuilder(
                            condition: state is! AddStudentGRLoadingState,
                            builder: (context) => ElevatedButton(
                              onPressed: () { if (_formKey.currentState?.validate() ?? false) {
                          BlocProvider.of<StudentGrCubit>(context).addStudenGR(
                                  studentName: studentNameController.text,
                                  studentEmail: studentEmailController.text,
                                  studentPassword: studentPasswordController.text,
                                  studentRepeatPassword: studentRepeatPasswordController.text
                                );
                                print("Student Added successfully");
                       }
                                
                              },
                              style: ElevatedButton.styleFrom(
                                // ignore: deprecated_member_use
                                backgroundColor: const Color(0xFF47AD95),
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
                            fallback: (context) =>
                                const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                                ],
                              ),
                ));
          },
        ),
    );
  }
}
