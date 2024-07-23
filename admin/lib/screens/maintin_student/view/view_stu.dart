import 'package:admin_interface22/cubits/student_cubit/student_cubit.dart';
import 'package:admin_interface22/cubits/student_cubit/student_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class view_stu extends StatefulWidget {
  const view_stu({super.key});

  @override
  State<view_stu> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<view_stu> {
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
          'View Students',
          style: TextStyle(
            fontFamily: 'Gabriela',
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      body: BlocConsumer<StudentCubit, StudentState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is viewStudentSuccessState) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: DataTable(
                  showBottomBorder: true,
                  border: const TableBorder(
                    horizontalInside: BorderSide(width: 1, style: BorderStyle.solid),
                    verticalInside: BorderSide(width: 1, style: BorderStyle.solid),
                  ),
                  columns: const [
                    DataColumn(
                      label: Text('ID'),
                    ),
                    DataColumn(
                      label: Text('Name'),
                    ),
                    DataColumn(
                      label: Text('Email'),
                    ),
                    DataColumn(
                      label: Text('Password'),
                    ),
                    DataColumn(
                      label: Text('Level'),
                    ),
                    DataColumn(
                      label: Text('Profile Photo'),
                    ),
                  ],
                  rows: state.viewstu.message!.map((student) {
                    return DataRow(
                      cells: [
                        DataCell(
                          Text(student.id!),
                        ),
                        DataCell(
                          Text(student.name!),
                        ),
                        DataCell(
                          Text(student.email!),
                        ),
                        DataCell(
                          Text(student.password!),
                        ),
                        DataCell(
                          Text(student.level!),
                        ),
                        DataCell(
                          Image.network(
                            student.profilePhoto!.url!,
                            width: 50,
                            height: 50,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error);
                            },
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            );
          } else if (state is viewStudentLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("error"));
          }
        },
      ),
    );
  }
}
