import 'package:admin_interface22/cubits/student_gr/student_gr_cubit.dart';
import 'package:admin_interface22/cubits/student_gr/student_gr_state.dart';
import 'package:admin_interface22/models/show_grst_umodel/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class viewGR extends StatefulWidget {
  const viewGR({super.key});

  @override
  State<viewGR> createState() => _viewGRState();
}

class _viewGRState extends State<viewGR> {
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
          'View Graduation Students',
          style: TextStyle(
            fontFamily: 'Gabriela',
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      body: BlocConsumer<StudentGrCubit, StudentGRState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is viewStudentGRSuccessState) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
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
                  rows: state.showgrstu.message!.map((Message student) {
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
          } else if (state is viewStudentGRLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("error"));
          }
        },
      ),
    );
  }
}
