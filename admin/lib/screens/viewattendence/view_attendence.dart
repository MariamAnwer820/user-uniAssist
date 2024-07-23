import 'package:admin_interface22/cubits/viewatt_cubit/viewattendence_cubit.dart';
import 'package:admin_interface22/cubits/viewatt_cubit/viewattendence_state.dart';
import 'package:admin_interface22/functions/snack_bar.dart';
import 'package:admin_interface22/screens/viewattendence/tableattendence.dart';
import 'package:admin_interface22/screens/viewattendence/tableattsection.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class attendence extends StatefulWidget {
  const attendence({super.key});

  @override
  State<attendence> createState() => attendenceState();
}

class attendenceState extends State<attendence> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController subjectTitleController = TextEditingController();

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
      body: SingleChildScrollView(
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
                    TextFormField(
                      controller: subjectTitleController,
                      decoration: InputDecoration(
                        labelText: 'Subject Name',
                        hintText: 'Enter subject name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 1.5,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        String transformedValue = value.isNotEmpty
                            ? value[0].toUpperCase() + value.substring(1).toLowerCase()
                            : value;
                        subjectTitleController.value = subjectTitleController.value.copyWith(
                          text: transformedValue,
                          selection: TextSelection.collapsed(offset: transformedValue.length),
                        );
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        final regex = RegExp(r'^[A-Z][a-z\s]*$');
                        if (!regex.hasMatch(value)) {
                          return 'The first character must be uppercase and the rest lowercase letters or spaces';
                        }
                        return null;
                      },
                    ),
                    BlocConsumer<ViewattendenceCubit, ViewattendenceState>(
                      listener: (context, state) {
                        if (state is ViewattendencelectureSuccessState) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => tableAttlec(),
                            ),
                          );
                        } else if (state is ViewattendencelectureErrorState) {
                          showSnackBar(context, "Error Please try again");
                        }
                      },
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ConditionalBuilder(
                            condition: state is! ViewattendencelectureLoadingState,
                            builder: (context) => ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState?.validate() ?? false) {
                                  BlocProvider.of<ViewattendenceCubit>(context)
                                      .viewAttendencelecture(
                                    subjectTitle: subjectTitleController.text,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
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
                                'Lecture',
                                style: TextStyle(
                                  fontFamily: 'Gabriela',
                                  color: Theme.of(context).colorScheme.secondary,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                            fallback: (context) => const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                    BlocConsumer<ViewattendenceCubit, ViewattendenceState>(
                      listener: (context, state) {
                        if (state is ViewattendencesectionSuccessState) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => tableAttsec(),
                            ),
                          );
                        } else if (state is ViewattendencesectionErrorState) {
                          showSnackBar(context, "Error Please try again");
                        }
                      },
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ConditionalBuilder(
                            condition: state is! ViewattendencesectionLoadingState,
                            builder: (context) => ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState?.validate() ?? false) {
                                  BlocProvider.of<ViewattendenceCubit>(context)
                                      .viewAttendencesection(
                                    subjectTitle: subjectTitleController.text,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
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
                                'Section',
                                style: TextStyle(
                                  fontFamily: 'Gabriela',
                                  color: Theme.of(context).colorScheme.secondary,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                            fallback: (context) => const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
