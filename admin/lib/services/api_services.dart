import 'package:admin_interface22/screens/cons.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  ApiService(this.dio);
  final String baseUrl = 'https://uni-assist-lyac.onrender.com';
//////////////////////////////////////////
//login
  Future<Response> loginUser({
    required String endPoint,
    String? userName,
    required String userEmail,
    required String userPassword,
  }) async {
    try {
      Response response = await dio.post(
        '$baseUrl$endPoint',
        data: {
          'email': userEmail,
          'password': userPassword,
        },
      );

      return response;
    } on DioException catch (e) {
      print(e);
      throw Exception(e.toString());
    } on Exception catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }
//////////////////////////////////////////
//student
  Future<Response> addStudent({
    required String endPoint,
    required String studentName,
    required String studentEmail,
    required String studentPassword,
    required String studentLevel,
  }) async {
    try {
      Response response = await dio.post(
        '$baseUrl$endPoint',
        options: Options(
          headers: {
            'token': token,
          },
        ),
        data: {
          'name': studentName,
          'email': studentEmail,
          'password': studentPassword,
          'level': studentLevel,
        },
      );
      print(response);
      return response;
    } on DioException catch (e) {
      print(e);
      throw Exception(e.toString());
    } on Exception catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  Future<Response> delStudent({
    required String endPoint,
    required String studentEmail,
  }) async {
    try {
      Response response = await dio.delete(
        '$baseUrl$endPoint',
        options: Options(
          headers: {
            'token': token,
          },
        ),
        data: {
          'email': studentEmail,
        },
      );
      print(response);
      return response;
    } on DioException catch (e) {
      print(e);
      throw Exception(e.toString());
    } on Exception catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  Future<Response> viewStudent({
    required String endPoint,
  }) async {
    try {
      Response response = await dio.get(
        '$baseUrl$endPoint',
        options: Options(
          headers: {
            'token': token,
          },
        ),
      );
      print(response);
      return response;
    } on DioException catch (e) {
      print(e);
      throw Exception(e.toString());
    } on Exception catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  Future<Response> delallStudent({
    required String endPoint,
    required String level,
  }) async {
    try {
      Response response = await dio.delete(
        '$baseUrl$endPoint',
        options: Options(
          headers: {
            'token': token,
          },
        ),
        data: {
          'level': level,
        },
      );
      print(response);
      return response;
    } on DioException catch (e) {
      print(e);
      throw Exception(e.toString());
    } on Exception catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

////////////////////////////////
//subject
  Future<Response> addingSubject({
    required String endPoint,
    required String subjectTitle,
    required String subjectId,
    required String subjectNumberOfHours,
  }) async {
    try {
      Response response = await dio.post(
        '$baseUrl$endPoint',
        options: Options(
          headers: {
            'token': token,
          },
        ),
        data: {
          'title': subjectTitle,
          'ID': subjectId,
          'numberOfHours': subjectNumberOfHours,
        },
      );
      print(response);
      return response;
    } on DioException catch (e) {
      print(e);
      throw Exception(e.toString());
    } on Exception catch (e) {
      print(e);
      throw Exception(e.toString());
    } 
  }


  Future<Response> delingSubject({
    required String endPoint,
    required String subjectId,
  }) async {
    try {
      Response response = await dio.delete(
        '$baseUrl$endPoint',
        options: Options(
          headers: {
            'token': token,
          },
        ),
        data: {
          'ID': subjectId,
        },
      );
      print(response);
      return response;
    } on DioException catch (e) {
      print(e);
      throw Exception(e.toString());
    } on Exception catch (e) {
      print(e);
      throw Exception(e.toString());
    } 
  }
  

  Future<Response> viewSubject({
    required String endPoint,
  }) async {
    try {
      Response response = await dio.get(
        '$baseUrl$endPoint',
        options: Options(
          headers: {
            'token': token,
          },
        ),
      );
      print(response);
      return response;
    } on DioException catch (e) {
      print(e);
      throw Exception(e.toString());
    } on Exception catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }


  ////////////////////////////////////////
  //GRstudent
  Future<Response> addStudentGR({
    required String endPoint,
    required String studentName,
    required String studentEmail,
    required String studentPassword,
    required String studentRepeatPassword,
  }) async {
    try {
      Response response = await dio.post(
        '$baseUrl$endPoint',
        options: Options(
          headers: {
            'token': token,
          },
        ),
        data: {
          'name': studentName,
          'email': studentEmail,
          'password': studentPassword,
          'repeat_password':studentPassword
        },
      );
      print(response);
      return response;
    } on DioException catch (e) {
      print(e);
      throw Exception(e.toString());
    } on Exception catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }


  Future<Response> delStudentGR({
    required String endPoint,
    required String studentEmail,
  }) async {
    try {
      Response response = await dio.delete(
        '$baseUrl$endPoint',
        options: Options(
          headers: {
            'token': token,
          },
        ),
        data: {
          'email': studentEmail,
        },
      );
      print(response);
      return response;
    } on DioException catch (e) {
      print(e);
      throw Exception(e.toString());
    } on Exception catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  Future<Response> viewStudentGR({
    required String endPoint,
  }) async {
    try {
      Response response = await dio.get(
        '$baseUrl$endPoint',
        options: Options(
          headers: {
            'token': token,
          },
        ),
      );
      print(response);
      return response;
    } on DioException catch (e) {
      print(e);
      throw Exception(e.toString());
    } on Exception catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

 Future<Response> moveGRstudent({
    required String endPoint,
  }) async {
    try {
      Response response = await dio.post(
        '$baseUrl$endPoint',
        options: Options(
          headers: {
            'token': token,
          },
        ),
      );
      print(response);
      return response;
    } on DioException catch (e) {
      print(e);
      throw Exception(e.toString());
    } on Exception catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

//////////////////////////////////////
//view attendence
  Future<Response> viewAttendencelecture({
    required String endPoint,
    required String subjectTitle ,
    
  }) async {
    try {
      Response response = await dio.get(
        '$baseUrl$endPoint',
        options: Options(
          headers: {
            'token': token,
          },
        ),
        data: {
          'title': subjectTitle,
        },
      );
      print(response);
      return response;
    } on DioException catch (e) {
      print(e);
      throw Exception(e.toString());
    } on Exception catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  Future<Response> viewAttendencesection({
    required String endPoint,
    required String subjectTitle ,
    
  }) async {
    try {
      Response response = await dio.get(
        '$baseUrl$endPoint',
        options: Options(
          headers: {
            'token': token,
          },
        ),
        data: {
          'title': subjectTitle,
        },
      );
      print(response);
      return response;
    } on DioException catch (e) {
      print(e);
      throw Exception(e.toString());
    } on Exception catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }
////////////////////////////////////
///stuff
 Future<Response> addStuff({
    required String endPoint,
    required String stuffName,
    required String stuffEmail,
    required String stuffPassword,
    required List<String> subject,
  }) async {
    try {
      Response response = await dio.post(
        '$baseUrl$endPoint',
        options: Options(
          headers: {
            'token': token,
          },
        ),
        data: {
          'name': stuffName,
          'email': stuffEmail,
          'password': stuffPassword,
          'subject': subject,
        },
      );
      print(response);
      return response;
    } on DioException catch (e) {
      print(e);
      throw Exception(e.toString());
    } on Exception catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  Future<Response> delStuff({
    required String endPoint,
    required String stuffEmail,
  }) async {
    try {
      Response response = await dio.delete(
        '$baseUrl$endPoint',
        options: Options(
          headers: {
            'token': token,
          },
        ),
        data: {
          'email': stuffEmail,
        },
      );
      print(response);
      return response;
    } on DioException catch (e) {
      print(e);
      throw Exception(e.toString());
    } on Exception catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  Future<Response> viewStuff({
    required String endPoint,
  }) async {
    try {
      Response response = await dio.get(
        '$baseUrl$endPoint',
        options: Options(
          headers: {
            'token': token,
          },
        ),
      );
      print(response);
      return response;
    } on DioException catch (e) {
      print(e);
      throw Exception(e.toString());
    } on Exception catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  /////////////////////////////////////////////
  //logout
Future<Response> logout() async {
    try {
      Response response = await dio.post(
        '$baseUrl/admin/logout',
        options: Options(
          headers: {
            'token': token,
          },
        ),
       
      );
      print(response);
      return response;
    } on DioException catch (e) {
      print(e);
      throw Exception(e.toString());
    } on Exception catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }
  
}



 