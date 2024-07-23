import 'package:admin_interface22/compontent/categorylevels.dart';
import 'package:admin_interface22/cubits/stuff/stuff_cubit.dart';
import 'package:admin_interface22/cubits/stuff/stuff_state.dart';
import 'package:admin_interface22/functions/snack_bar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class addAcd extends StatefulWidget {
  const addAcd({super.key});

  @override
  State<addAcd> createState() => AddStuState();
}

class AddStuState extends State<addAcd> {
  TextEditingController stuffNameController = TextEditingController();
  TextEditingController stuffEmailController = TextEditingController();
  TextEditingController stuffPasswordController = TextEditingController();
  String dropdownvalue1 = 'Nlp';
  String dropdownvalue2 = 'Hci';
  var items1 = ['Nlp', 'Hci', 'Iot', 'Computer Vision', 'Compiler', 'Flutter', 'Web', 'Machine Learning'];
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
      body: BlocConsumer<StuffCubit, StuffState>(
        listener: (context, state) {
          if (state is AddStuffSuccessState) {
            showSnackBar(context, "Added Successfully");
          } else if (state is AddStuffErrorState) {
            showSnackBar(context, "Error, try again");
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
                      ),
                    ),
                    child: Column(
                      children: [
                        categorylevel(
                          controller: stuffNameController,
                          text: 'Stuff Name',
                          hinttext: 'Stuff name',
                          colorcon: Theme.of(context).colorScheme.primary,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            } else if (value.length < 15) {
                              return 'Name must be at least 15 characters long';
                            }
                            return null;
                          },
                        ),
                        categorylevel(
                          controller: stuffEmailController,
                          text: 'Stuff Email',
                          hinttext: 'Stuff email',
                          colorcon: Theme.of(context).colorScheme.primary,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                        ),
                        categorylevel(
                          controller: stuffPasswordController,
                          text: 'Stuff Password',
                          hinttext: 'Stuff password',
                          colorcon: Theme.of(context).colorScheme.primary,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            } else if (value.length < 14) {
                              return 'Password must be at least 14 characters long';
                            }
                            return null;
                          },
                        ),
                        
                            const Text(
                              'Subject 1',
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
                              items: items1.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
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
                        
                       
                            const Text(
                              'Subject 2',
                              style: TextStyle(
                                fontFamily: 'Gabriela',
                                color: Color(0xFF47AD95),
                                fontSize: 23,
                              ),
                            ),
                            DropdownButton(
                              dropdownColor: Theme.of(context).colorScheme.primary,
                              elevation: 0,
                              value: dropdownvalue2,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              iconSize: 30,
                              underline: const SizedBox(),
                              items: items1.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
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
                                  dropdownvalue2 = newValue!;
                                });
                              },
                            ),
                          
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ConditionalBuilder(
                            condition: state is! AddStuffLoadingState,
                            builder: (context) => ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState?.validate() ?? false) {
                                  BlocProvider.of<StuffCubit>(context).addStuff(
                                    stuffName: stuffNameController.text,
                                    stuffEmail: stuffEmailController.text,
                                    stuffPassword: stuffPasswordController.text,
                                    subject: [dropdownvalue1, dropdownvalue2], // Update here to handle multiple subjects
                                  );
                                  print("Stuff added successfully");
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF47AD95),
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
