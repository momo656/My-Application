import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio? dio;


  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {'Content-Type':'application/json'},
      ),
    );
    dio!.interceptors.add(LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      logPrint: print,
    ));
  }

  static Future<Response> getData({
    @required url,
     Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers={
      'Authorization':token??'',
    };
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }
  static Future<Response> postData({
 required url,
 required Map<String, dynamic> data ,
}) async{
    return dio!.post(
      url,
      data: data,
    );

  }
}

//newsapi.org/
// v2/top-headlines?
// country=us&category=business&apiKey=d008ad3bf25945d7a40bf97f8e2ef167
//newsapi.org/v2/everything?
// q=tesla&apiKey=d008ad3bf25945d7a40bf97f8e2ef167