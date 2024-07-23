import 'package:admin_interface22/cubits/student_cubit/student_cubit.dart';
import 'package:admin_interface22/cubits/student_cubit/student_state.dart';
import 'package:admin_interface22/functions/snack_bar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Deleteall extends StatefulWidget {
  const Deleteall({super.key});

  @override
  State<Deleteall> createState() => addsubState();
}

class addsubState extends State<Deleteall> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropdownvalue1 = '1';
  var items1 = ['1','2', '3','4'];
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
          body: BlocConsumer<StudentCubit, StudentState>(
            listener: (context, state) {
               if (state is delallStudentSuccessState) {
            showSnackBar(context, "Deleted Successfully");
            //showSnackBar(context, state.message);
          } else if (state is delallStudentErrorState) {
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
                              condition: state is! delallStudentLoadingState,
                            builder: (context) => ElevatedButton(
                              onPressed: () {
                                
                                 if (_formKey.currentState?.validate() ?? false) {
                         BlocProvider.of<StudentCubit>(context).delallStudent(
                                  
                                  level: dropdownvalue1,
                                ); 
                       }
                                print("level deleted successfully");
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
                                'Delete',
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
