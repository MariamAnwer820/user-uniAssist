import 'package:admin_interface22/compontent/categorylevels.dart';
import 'package:admin_interface22/cubits/subject_cubit/subject_cubit.dart';
import 'package:admin_interface22/cubits/subject_cubit/subject_state.dart';
import 'package:admin_interface22/functions/snack_bar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class addsub extends StatefulWidget {
  const addsub({super.key});

  @override
  State<addsub> createState() => addsubState();
}

class addsubState extends State<addsub> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   TextEditingController subjectTitleController = TextEditingController();
    TextEditingController subjectIDController = TextEditingController();
  String dropdownvalue1 = '2';
  var items1 = ['2', '3'];
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
          body: BlocConsumer<SubjectCubit, SubjectState>(
            listener: (context, state) {
               if (state is AddingSubjectSuccessState) {
            showSnackBar(context, "Added Successfully");
            //showSnackBar(context, state.message);
          } else if (state is AddingSubjectErrorState) {
            showSnackBar(context, "error");
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
                          color: Theme.of(context).colorScheme.primary,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                            width: 2,
                          )),
                      child: Column(
                        children: [
                          categorylevel(
                            controller: subjectTitleController,
                            text: 'Subject Name',
                            hinttext: 'Subject name',
                            colorcon: Theme.of(context).colorScheme.primary,
                            validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                          ),
                          categorylevel(
                            controller: subjectIDController,
                            text: 'Subject ID',
                            hinttext: 'Subject id',
                            colorcon: Theme.of(context).colorScheme.primary,
                            validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'Num of Hours',
                                style: TextStyle(
                                    fontFamily: 'Gabriela',
                                    color: Color(0xFF47AD95),
                                    fontSize: 23),
                              ),
                              DropdownButton(
                                dropdownColor:
                                    Theme.of(context).colorScheme.primary,
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
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
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
                              condition: state is! AddingSubjectLoadingState,
                            builder: (context) => ElevatedButton(
                              onPressed: () {
                                
                                 if (_formKey.currentState?.validate() ?? false) {
                         BlocProvider.of<SubjectCubit>(context).addSubject(
                                  subjectTitle: subjectTitleController.text,
                                  subjectId: subjectIDController.text,
                                  subjectNumberOfHours: dropdownvalue1,
                                ); 
                       }
                                print("Subject added successfully");
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
                            ), fallback: (context) => const CircularProgressIndicator(
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
