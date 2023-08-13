import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pinterest/main.dart';
import 'package:pinterest/pages/dashboard/no_internet_page.dart';

import 'connectivity_request_retrier.dart';

class ConnectivityInterceptor extends Interceptor {
  final DioConnectivityRequestRetrier requestRetrier =
      DioConnectivityRequestRetrier();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    print("=======================${err.type}=========================");
    try {
      if (err.error is SocketException &&
              err.type == DioExceptionType.unknown ||
          err.error == DioExceptionType.connectionError) {
        print("============part1===========");

        BuildContext? context = navigatorKey.currentContext;

        Navigator.push(
          context!,
          MaterialPageRoute(
            builder: (context) => NoInternetPage(),
          ),
        );
        ScaffoldMessenger.of(context!).showSnackBar(
          const SnackBar(
            content: Text("No Internet Connection"),
          ),
        );
        handler.resolve(
            await requestRetrier.scheduleRetryRequest(err.requestOptions));
      } else {
        print("============part2===========");
        print("============${err.type}===========");
        print("============${err.error}===========");
        handler.next(err);
      }
    } on SocketException {
      print("SOCKET EXCEPTION");
    } on DioException catch (e) {
      print(e.message);
    }
  }
}
