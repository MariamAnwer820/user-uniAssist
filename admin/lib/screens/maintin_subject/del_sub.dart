import 'package:admin_interface22/compontent/categorylevels.dart';
import 'package:admin_interface22/cubits/subject_cubit/subject_cubit.dart';
import 'package:admin_interface22/cubits/subject_cubit/subject_state.dart';
import 'package:admin_interface22/functions/snack_bar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class delsub extends StatefulWidget {
  const delsub({super.key});

  @override
  State<delsub> createState() => delsubState();
}

class delsubState extends State<delsub> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController subiectIDController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              if (state is delingSubjectSuccessState) {
            showSnackBar(context, "deleted Successfully");
           //showSnackBar(context, state.message);
          } else if (state is delingSubjectErrorState) {
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
                            controller: subiectIDController,
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ConditionalBuilder(
                              condition: state is! delingSubjectLoadingState,
                            builder: (context) => ElevatedButton(
                              
                                onPressed: () {
                                   if (_formKey.currentState?.validate() ?? false) {
                                                        BlocProvider.of<SubjectCubit>(context).delSubject(
                              subjectId: subiectIDController.text
                                                        ); 
                                                     }
                                                      print("Subject deleted successfully");
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
                                      color:
                                          Theme.of(context).colorScheme.secondary,
                                    )),
                                child: Text(
                                  'DELETE',
                                  style: TextStyle(
                                      fontFamily: 'Gabriela',
                                      color:
                                          Theme.of(context).colorScheme.secondary,
                                      fontSize: 35),
                                ),
                              ), fallback: (context) => const CircularProgressIndicator(
                              color: Colors.white,
                            ),  

                               
                            ),
                            
                            ),
                          
                        ],
                      ),
                    )
                  ]
                ),
                  ),
              );
            },
          ),
        );
  }
}
