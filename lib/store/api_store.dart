import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../interceptor/connectivity_interceptor.dart';
import '../modal/image.dart';

part 'api_store.g.dart';

class APIService = _APIService with _$APIService;

abstract class _APIService with Store {
  // @observable
  // List<Widget> leftColumn = [];
  // @observable
  // List<Widget> rightColumn = [];
  // @observable
  // double totalHeightLeft = 0;
  // @observable
  // double totalHeightRight = 0;



  @observable
  ObservableFuture<List<Images>>? getImages;

  _APIService() {
    getImages = ObservableFuture<List<Images>>(fetchImages());
  }

  @action
  void distributeImages(List<Images>? images) {
    List<Widget> leftColumn = [];
    List<Widget> rightColumn = [];
    double totalHeightLeft = 0;
    double totalHeightRight = 0;

    for (int i = 0; i < images!.length; i++) {
      double imageHeight = images[i].height!.toDouble() / 20;

      if (totalHeightLeft <= totalHeightRight) {
        leftColumn.add(buildImageContainer(imageHeight, i));
        totalHeightLeft += imageHeight;
      } else {
        rightColumn.add(buildImageContainer(imageHeight, i));
        totalHeightRight += imageHeight;
      }
    }
  }

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
      distributeImages(images);
      return images.map((e) {
        return Images.fromJson(e);
      }).toList();
    }else{
      throw Exception("Error in fetching data");
    }
  }
}
