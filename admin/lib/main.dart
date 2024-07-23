import 'package:admin_interface22/compontent/theme_provider.dart';
import 'package:admin_interface22/cubits/auth_cubit/auth_cubit.dart';
import 'package:admin_interface22/cubits/student_cubit/student_cubit.dart';
import 'package:admin_interface22/cubits/student_gr/student_gr_cubit.dart';
import 'package:admin_interface22/cubits/stuff/stuff_cubit.dart';
import 'package:admin_interface22/cubits/subject_cubit/subject_cubit.dart';
import 'package:admin_interface22/cubits/viewatt_cubit/viewattendence_cubit.dart';
import 'package:admin_interface22/screens/login.dart';
import 'package:admin_interface22/services/api_services.dart';
import 'package:admin_interface22/services/cache_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheService.initSharedPreference();
  runApp(ChangeNotifierProvider(
    create: (context) => themeprovider(),
    child: MyWidget(),
  ));
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            ApiService(
              Dio(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => StudentCubit(
            ApiService(
              Dio(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => SubjectCubit(
            ApiService(
              Dio(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => StudentGrCubit(
            ApiService(
              Dio(),
            ),
          ),
        ),

        BlocProvider(
          create: (context) => ViewattendenceCubit(
            ApiService(
              Dio(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => StuffCubit(
            ApiService(
              Dio(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: login_page(),
        theme: Provider.of<themeprovider>(context).themeData,
      ),
    );
  }
}
