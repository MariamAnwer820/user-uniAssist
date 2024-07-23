import 'package:admin_interface22/cubits/viewatt_cubit/viewattendence_cubit.dart';
import 'package:admin_interface22/cubits/viewatt_cubit/viewattendence_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class tableAttsec extends StatefulWidget {
  const tableAttsec({super.key});

  @override
  State<tableAttsec> createState() => _tableAttState();
}

class _tableAttState extends State<tableAttsec> {
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
                'Attendence Section',
                style: TextStyle(
                    fontFamily: 'Gabriela',
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ),
            body: BlocConsumer<ViewattendenceCubit, ViewattendenceState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ViewattendencesectionSuccessState) {
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
                    DataColumn(label: Text('Subject')),
                    DataColumn(label: Text('Type')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Week1')),
                    DataColumn(label: Text('Week2')),
                    DataColumn(label: Text('Week3')),
                    DataColumn(label: Text('Week4')),
                    DataColumn(label: Text('Week5')),
                    DataColumn(label: Text('Week6')),
                    DataColumn(label: Text('Week7')),
                    DataColumn(label: Text('Total')),
                  ],
                  rows: state.SECattendence.attendanceArray!.map((attendance) {
                    return DataRow(
                      cells: [
                        DataCell(Text(attendance.subject ?? '')),
                        DataCell(Text(attendance.type ?? '')),
                        DataCell(Text(attendance.name ?? '')),
                        DataCell(Text(attendance.week1?.toString() ?? '')),
                        DataCell(Text(attendance.week2?.toString() ?? '')),
                        DataCell(Text(attendance.week3?.toString() ?? '')),
                        DataCell(Text(attendance.week4?.toString() ?? '')),
                        DataCell(Text(attendance.week5?.toString() ?? '')),
                        DataCell(Text(attendance.week6?.toString() ?? '')),
                        DataCell(Text(attendance.week7?.toString() ?? '')),
                        DataCell(Text(attendance.total?.toString() ?? '')),
                      ],
                    );
                  }).toList(),
                ),
              ),
            );
          } else if (state is ViewattendencelectureLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("Error loading data"));
          }
        },
      ),
                
            
    );
  }
}