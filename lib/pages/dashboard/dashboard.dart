import 'package:flutter/material.dart';
import 'package:pinterest/pages/dashboard/watch_tab.dart';

import '../../store/api_store.dart';
import 'browse_tab.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: 0,
      children: [
        DefaultTabController(
          length: 2,
          initialIndex: 0,
          animationDuration: const Duration(milliseconds: 500),
          child: Scaffold(
            appBar: AppBar(
              title: const TabBar(tabs: [
                Text("Browse"),
                Text("Watch"),
              ],
                indicatorColor: Colors.white,
                indicatorWeight: 3,
                splashFactory: InkSplash.splashFactory,
                labelPadding: EdgeInsets.only(bottom: 5),
                indicatorSize: TabBarIndicatorSize.label,
              ),
            ),
            body: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
                BrowseTab(),
                watchTab(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
