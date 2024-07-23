import 'package:admin_interface22/cubits/stuff/stuff_cubit.dart';
import 'package:admin_interface22/cubits/stuff/stuff_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class viewAcd extends StatefulWidget {
  const viewAcd({super.key});

  @override
  State<viewAcd> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<viewAcd> {
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
          'View Academic Stuff',
          style: TextStyle(
            fontFamily: 'Gabriela',
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      body: BlocConsumer<StuffCubit, StuffState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is viewStuffSuccessState) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: DataTabyle(
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
                      label: Text('Subject'),
                    ),
                    DataColumn(
                      label: Text('Profile Photo'),
                    ),
                  ],
                  rows: state.viewStuff.acadmicSatff!.map((student) {
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
                          Text(student.subject?.join(',')??''),
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
          } else if (state is viewStuffLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("error"));
          }
        },
      ),
    );
  }
}
