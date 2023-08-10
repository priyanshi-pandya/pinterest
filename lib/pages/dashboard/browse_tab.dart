import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:pinterest/store/api_store.dart';

import '../../modal/image.dart';

class BrowseTab extends StatelessWidget {
  BrowseTab({super.key});

  List<Widget> leftColumn = [];
  List<Widget> rightColumn = [];
  double totalHeightLeft = 0;
  double totalHeightRight = 0;

  APIService _apiService = APIService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Observer(builder: (context) => _buildContent()),
      ),
    );
  }

  Widget _buildContent() {
    if (_apiService.getImages?.status == FutureStatus.pending) {
      return const Center(child: CircularProgressIndicator());
    } else if (_apiService.getImages?.status == FutureStatus.fulfilled) {
      distributeImages(_apiService.getImages?.value);
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: leftColumn,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: rightColumn,
            ),
          ),
        ],
      );
    } else if (_apiService.getImages?.status == FutureStatus.rejected) {
      return Center(child: Text('Error: ${_apiService.getImages?.error}'));
    } else {
      return const Center(child: Text('No data available.'));
    }
  }

  void distributeImages(List<Images>? images) {
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

  Widget buildImageContainer(double height, int idx) {
    return Container(
      height: height,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(
              _apiService.getImages!.value![idx].urls!.regular!.toString()),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
