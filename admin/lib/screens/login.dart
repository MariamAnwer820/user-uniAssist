// ignore: unused_import
import 'package:admin_interface22/cubits/auth_cubit/auth_cubit.dart';
import 'package:admin_interface22/cubits/auth_cubit/auth_state.dart';
import 'package:admin_interface22/functions/snack_bar.dart';
import 'package:admin_interface22/screens/cons.dart';
import 'package:admin_interface22/screens/home.dart';
import 'package:admin_interface22/services/cache_services.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class login_page extends StatelessWidget {
  login_page({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController userEmailController = TextEditingController();
    TextEditingController userPasswordController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xFF353535),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.userModel.status == 'Success') {
              CacheService.saveData(
                key: 'token',
                value: state.userModel.token,
              ).then(
                (value) {
                  print("login successfully");
                  
                  token =CacheService.getData(key: 'token');
                  print(token);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => home_page()),
                  );
                },
              );
            }else{
              showSnackBar(context, "This user not found ");
            }
          }
        },
        builder: (context, state) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 110),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 90,
                    backgroundColor: Color(0xFF707070),
                    child: CircleAvatar(
                      radius: 85,
                      backgroundImage: AssetImage('image/0000.png'),
                    ),
                  ),
                  const Text(
                    'DASHBOARD SCREEN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'Gabriela',
                    ),
                  ),
                  const Text(
                    'UNI-ASSIST DEVELOPER',
                    style: TextStyle(
                      color: Color(0xFF6C8090),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    color: Color(0xFF6C8090),
                    thickness: 1,
                    indent: 50,
                    endIndent: 50,
                    height: 10,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                    child: TextFormField(
                      controller: userEmailController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1.5),
                        ),
                        filled: true,
                        fillColor: const Color(0xFF707070),
                        labelText: 'EMAIL',
                        labelStyle: const TextStyle(
                          color: Color(0xFFB7B7B7),
                          fontSize: 30,
                          fontFamily: 'Gabriela',
                        ),
                      ),
                       validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    else if (!EmailValidator.validate(value)) {
                          return 'Please enter a valid email';
                        } else if (!value.endsWith('@fci.bu.edu.eg')) {
                          return 'Email must end with @fci.bu.edu.eg';
                        }
                    return null;
                  },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    child: TextFormField(
                      maxLength: 14,
                      controller: userPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1.5),
                        ),
                        filled: true,
                        fillColor: const Color(0xFF707070),
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          color: Color(0xFFB7B7B7),
                          fontSize: 30,
                          fontFamily: 'Gabriela',
                        ),
                      ),
                       validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    } 
                    else if (value.length < 14 || !RegExp(r'^\d+$').hasMatch(value)){
                          return "Please enter a valid password (at least 14 numbers)";
                        }
                    return null;
                  },
                    ),
                  ),
                  ConditionalBuilder(
                    condition: state is! LoginLoadingState,
                    builder: (context) => ElevatedButton(
                      onPressed: () {
                       if (_formKey.currentState?.validate() ?? false) {
                          BlocProvider.of<AuthCubit>(context).userLogin(
                            userEmail: userEmailController.text,
                            userPassword: userPasswordController.text,
                          ); 
                       }
                      },
                      style: ElevatedButton.styleFrom(
                        // ignore: deprecated_member_use
                        backgroundColor: const Color(0xFF47AD95),
                        minimumSize: const Size(80, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: const BorderSide(
                          width: 1.5,
                          color: Colors.white,
                        ),
                      ),
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Gabriela',
                        ),
                      ),
                    ),
                    fallback: (context) => const CircularProgressIndicator(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
