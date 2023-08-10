import 'dart:io';

import 'package:dio/dio.dart';

import 'connectivity_request_retrier.dart';

class ConnectivityInterceptor extends Interceptor{
  final DioConnectivityRequestRetrier requestRetrier =
  DioConnectivityRequestRetrier();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async{
    print("=======================${err.type}=========================");
    try{
      if(err.error == SocketException && err.type == DioExceptionType.connectionError && err.type == DioExceptionType.unknown){
        handler.resolve(await requestRetrier.scheduleRetryRequest(err.requestOptions));
      }else{
        handler.next(err);
      }
    }on SocketException{
      print("SOCKET EXCEPTION");
    }on DioException catch(e){
      print(e.message);
    }
  }
}