// ignore_for_file: unused_import
import 'package:admin_interface22/cubits/student_cubit/student_cubit.dart';
import 'package:admin_interface22/cubits/student_gr/student_gr_cubit.dart';
import 'package:admin_interface22/cubits/student_gr/student_gr_state.dart';
import 'package:admin_interface22/functions/snack_bar.dart';
import 'package:admin_interface22/screens/maintin_student/students/add_stu.dart';
import 'package:admin_interface22/screens/maintin_student/students/del_stu.dart';
import 'package:admin_interface22/screens/maintin_student/maintain_gr/maintin_gr.dart';
import 'package:admin_interface22/screens/maintin_student/view/view_stu.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:admin_interface22/compontent/category.dart';
import 'package:admin_interface22/screens/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(uploadfile());
}

class uploadfile extends StatefulWidget {
  @override
  State<uploadfile> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<uploadfile> {
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
                  color: Theme.of(context).colorScheme.secondary),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: Container(
                          child: Image.asset('image/cloud-upload.png'),
                        ),
                      ),
                      Text(
                        'Upload files',
                        style: TextStyle(
                            fontFamily: 'Gabriela',
                            fontSize: 20.2,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ],
                  ),
                 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      category(
                          image: 'image/8-01.png',
                          text: "Upload Student File",
                          fontSize: 14.9,
                          ontap: () {
                            _pickFileAndUploadstudent(context);
                          },
                          colorcontainer: Theme.of(context).colorScheme.primary,
                          border1: Theme.of(context).colorScheme.secondary),
                      category(
                          image: 'image/8-01.png',
                          text: "Upload Academic Stuff File",
                          fontSize: 14.9,
                          ontap: () {
                            {
                              _pickFileAndUploadacademic(context);
                            }
                            ;
                          },
                          colorcontainer: Theme.of(context).colorScheme.primary,
                          border1: Theme.of(context).colorScheme.secondary),
                    ],
                  ),
                  
                ],
              ),
            ),
          ),
    );
  }
}

Future<void> _pickFileAndUploadstudent(BuildContext context) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    String filePath = result.files.single.path!;
    _uploadFile(context, filePath);
  } else {
    // User canceled the picker
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("File selection cancelled")),
    );
  }
}

Future<void> _uploadFile(BuildContext context, String filePath) async {
  Dio dio = Dio();
  String uploadUrl = "https://uni-assist-lyac.onrender.com/admin/upload-student-file";

  FormData formData = FormData.fromMap({
    "file": await MultipartFile.fromFile(filePath, filename: "upload..xlsx"),
  });

  try {
    Response response = await dio.post(uploadUrl, data: formData);

    if (response.statusCode == 200) {
      print("File uploaded successfully");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("File uploaded successfully")),
      );
    } else {
      print("File upload failed with status: ${response.statusCode}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("File upload failed: ${response.statusCode}")),
      );
    }
  } catch (e) {
    print("Error during file upload: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error during file upload: $e")),
    );
  }
}





Future<void> _pickFileAndUploadacademic(BuildContext context) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    String filePath = result.files.single.path!;
    _uploadFile(context, filePath);
  } else {
    // User canceled the picker
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("File selection cancelled")),
    );
  }
}

Future<void> _uploadFileacademic(BuildContext context, String filePath) async {
  Dio dio = Dio();
  String uploadUrl = "https://uni-assist-lyac.onrender.com/admin/upload-acadmic-staff-file";

  FormData formData = FormData.fromMap({
    "file": await MultipartFile.fromFile(filePath, filename: "upload..xlsx"),
  });

  try {
    Response response = await dio.post(uploadUrl, data: formData);

    if (response.statusCode == 200) {
      print("File uploaded successfully");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("File uploaded successfully")),
      );
    } else {
      print("File upload failed with status: ${response.statusCode}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("File upload failed: ${response.statusCode}")),
      );
    }
  } catch (e) {
    print("Error during file upload: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error during file upload: $e")),
    );
  }
}
