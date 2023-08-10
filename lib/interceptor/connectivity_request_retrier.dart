import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import '../store/api_store.dart';

class DioConnectivityRequestRetrier{
  Connectivity connectivity = Connectivity();
  final Dio dio = Dio();

  Future scheduleRetryRequest(RequestOptions requestOptions){
    final completer = Completer();
    StreamSubscription<dynamic>? subscription;
    subscription = connectivity.onConnectivityChanged.listen((connectivityResult) async{
      if(connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
        unawaited(subscription?.cancel());
        completer.complete(
          dio.fetch(requestOptions),
        );
    }
    });
    return completer.future;
  }
}