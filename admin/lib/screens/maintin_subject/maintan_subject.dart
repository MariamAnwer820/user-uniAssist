import 'package:admin_interface22/cubits/subject_cubit/subject_cubit.dart';
import 'package:admin_interface22/screens/maintin_subject/add_sub.dart';
import 'package:admin_interface22/screens/maintin_subject/del_sub.dart';
import 'package:admin_interface22/screens/maintin_subject/viewsubject.dart';
import 'package:flutter/material.dart';
import 'package:admin_interface22/compontent/category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(maintan_subject());
}

class maintan_subject extends StatefulWidget {
  @override
  State<maintan_subject> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<maintan_subject> {
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 40,
                          child: Image.asset('image/9-01.png'),
                        ),
                        Text(
                          'Maintenance Subject Information',
                          style: TextStyle(
                              fontFamily: 'Gabriela',
                              fontSize: 18.2,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      category(
                          image: 'image/10-01.png',
                          text: "Delete Subject",
                          fontSize: 16.9,
                          ontap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const delsub();
                            }));
                          },
                          colorcontainer: Theme.of(context).colorScheme.primary,
                          border1: Theme.of(context).colorScheme.secondary),
                      category(
                          image: 'image/3-01.png',
                          text: "Add Subject",
                          fontSize: 16.9,
                          ontap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const addsub();
                            }));
                          },
                          colorcontainer: Theme.of(context).colorScheme.primary,
                          border1: Theme.of(context).colorScheme.secondary),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      category(
                          image: 'image/research.png',
                          text: "View Subjects",
                          fontSize: 16.9,
                          ontap: () {
                            BlocProvider.of<SubjectCubit>(context).viewSubject();
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Viewsubjectp();
                            }));
                          },
                          colorcontainer: Theme.of(context).colorScheme.primary,
                          border1: Theme.of(context).colorScheme.secondary),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}




