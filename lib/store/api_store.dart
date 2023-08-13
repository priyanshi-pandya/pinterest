import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../interceptor/connectivity_interceptor.dart';
import '../modal/image.dart';

part 'api_store.g.dart';

class APIService = _APIService with _$APIService;

abstract class _APIService with Store {

  @observable
  ObservableFuture<List<Images>>? getImages;

  // @observable
  // ConnectivityResult connectivityResult = ConnectivityResult.none;

  _APIService() {
    getImages = ObservableFuture<List<Images>>(fetchImages());
  }

  // @action
  // void distributeImages(List images) {
  //   List<Widget> leftColumn = [];
  //   List<Widget> rightColumn = [];
  //   double totalHeightLeft = 0;
  //   double totalHeightRight = 0;
  //
  //   for (int i = 0; i < images!.length; i++) {
  //     double imageHeight = images[i].height!.toDouble() / 20;
  //
  //     if (totalHeightLeft <= totalHeightRight) {
  //       leftColumn.add(buildImageContainer(imageHeight, images[i]));
  //       totalHeightLeft += imageHeight;
  //     } else {
  //       rightColumn.add(buildImageContainer(imageHeight, images[i]));
  //       totalHeightRight += imageHeight;
  //     }
  //   }
  // }
  //
  // @action
  // Widget buildImageContainer(double height, Images img) {
  //   return Container(
  //     height: height,
  //     margin: const EdgeInsets.all(8),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(8),
  //       image: DecorationImage(
  //         image: NetworkImage(
  //           img.urls!.regular.toString(),),
  //         fit: BoxFit.fill,
  //       ),
  //     ),
  //   );
  // }

  // @action
  // Future<void> checkAndFetchData() async{
  //   connectivityResult == await Connectivity().checkConnectivity();
  //   print("=================${connectivityResult}===============");
  //     if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
  //       getImages = ObservableFuture(fetchImages());
  //     }
  // }

  @action
  Future<List<Images>> fetchImages() async {
    Dio dio = Dio();
    dio.interceptors.add(ConnectivityInterceptor());
    final response = await dio.get(
      "https://api.unsplash.com/photos/?client_id=5Cj-sCZZzo8LdPnYEMl3OpdXSZ25TnyEoabEpdM2FII&per_page=30",
    );

    log(response.statusCode.toString(), name: "STATUS CODE");
    if(response.statusCode == 200){
      List images = response.data;
      return images.map((e) {
        // distributeImages(images);
        return Images.fromJson(e);
      }).toList();
    }else{
      throw Exception("Error in fetching data");
    }
  }
}
