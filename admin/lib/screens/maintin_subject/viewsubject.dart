import 'package:admin_interface22/cubits/subject_cubit/subject_cubit.dart';
import 'package:admin_interface22/cubits/subject_cubit/subject_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Viewsubjectp extends StatefulWidget {
  const Viewsubjectp({super.key});

  @override
  State<Viewsubjectp> createState() => _ViewsubjectState();
}

class _ViewsubjectState extends State<Viewsubjectp> {
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
          'View Subjects',
          style: TextStyle(
            fontFamily: 'Gabriela',
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      body: BlocConsumer<SubjectCubit, SubjectState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is viewSubjectSuccessState) {
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
                      label: Text('Title'),
                    ),
                    DataColumn(
                      label: Text('Subject ID'),
                    ),
                    DataColumn(
                      label: Text('Number of hours'),
                    ),
                    DataColumn(
                      label: Text('Lectures'),
                    ),
                    DataColumn(
                      label: Text('Sections'),
                    ),
                  ],
                  rows: state.viewsubject.message!.map((subject) {
                    return DataRow(
                      cells: [
                        DataCell(
                          Text(subject.id??''),
                        ),
                        DataCell(
                          Text(subject.title??''),
                        ),
                        DataCell(
                          Text(subject.idsb??''),
                        ),
                        DataCell(
                          Text(subject.numberOfHours??''),
                        ),
                        DataCell(
                          Text(subject.lectures?.join(',')??''),
                        ),
                        DataCell(
                          Text(subject.sections?.join(',')??''),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            );
          } else if (state is viewSubjectLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("error"));
          }
        },
      ),
    );
    
  }
}