import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:pinterest/pages/dashboard/browse_detail_page.dart';
import 'package:pinterest/store/api_store.dart';

import '../../modal/image.dart';
import '../../modal/social_media.dart';

class BrowseTab extends StatefulWidget {
  BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  List<Widget> leftColumn = [];
  List<Widget> rightColumn = [];
  double totalHeightLeft = 0;
  double totalHeightRight = 0;

  final APIService _apiService = APIService();

  @override
  void initState() {
    super.initState();
    _apiService.getImages
        ?.whenComplete(() => distributeImages(_apiService.getImages?.value));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Observer(
            builder: (context) => _buildContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    print(
        '=====================${_apiService.getImages?.status}=====================');
    if (_apiService.getImages?.status == FutureStatus.pending) {
      // if(Connectivity().checkConnectivity() is ConnectivityResult.none)
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (_apiService.getImages?.status == FutureStatus.fulfilled) {
      Navigator.maybePop(context);
      // distributeImages(_apiService.getImages?.value);
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
      return Center(
        child: Image.asset(
          'asset/image/no_internet.png',
          height: 250,
          width: 200,
        ),
      );
    } else {
      return const Center(
        child: Text('No data available.'),
      );
    }
  }

  void distributeImages(List<Images>? images) {
    for (int i = 0; i < images!.length; i++) {
      double imageHeight = images[i].height!.toDouble() / 20;

      if (totalHeightLeft < totalHeightRight) {
        leftColumn.add(buildImageContainer(imageHeight, i));
        totalHeightLeft += imageHeight;
      } else {
        rightColumn.add(buildImageContainer(imageHeight, i));
        totalHeightRight += imageHeight;
      }
    }
  }

  Widget buildImageContainer(double height, int idx) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    BrowseDetailPage(image: _apiService.getImages!.value![idx]),
              ),
            ),
            child: Container(
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(_apiService
                      .getImages!.value![idx].urls!.regular!
                      .toString()),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            children: [
              Image.asset(
                'asset/image/heart.png',
                height: 20,
                width: 17,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                _apiService.getImages?.value?[idx].likes.toString() ?? "",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  openBottomSheet(context);
                },
                icon: const Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future openBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.53,
        decoration: const BoxDecoration(
          color: Colors.black87,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Image.asset('asset/image/close.png'),
                  const SizedBox(
                    width: 12,
                  ),
                  const Text(
                    'Share to',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 80,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                shrinkWrap: true,
                itemCount: socialMediaList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: socialMediaList[index].colors,
                          child: Image.asset(
                              'asset/image/${socialMediaList[index].socialImagePath}.png',
                              height: 35),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          socialMediaList[index].socialName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(color: Colors.white10),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: shareToOtherList.length,
              padding: const EdgeInsets.symmetric(vertical: 5),
              itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shareToOtherList[index].title.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    if (shareToOtherList[index].desc != null) ...[
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        shareToOtherList[index].desc.toString(),
                      ),
                    ]
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(color: Colors.grey),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                'This Pin was inspired by your recent activity',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
