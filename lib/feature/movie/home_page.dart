import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieappget/feature/movie/domain/entity/movies.dart';
import 'package:movieappget/feature/movie/home_controller.dart';
import 'package:movieappget/feature/movie/movietype/nowplaying/nowplay_page.dart';
import 'package:movieappget/feature/movie/movietype/popular/popular_page.dart';
import 'package:movieappget/feature/shared/component/icon_tab.dart';
import 'package:movieappget/feature/shared/movie_type.dart';

class MovieHomePage extends GetView<HomeController> {
  static const routeName = '/home';

  final movieTabPage = {
    MovieType.popular : PopularPage(),
    MovieType.nowplaying : NowPlayPage()
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color : Colors.black),
          title: Text(
            'Movie Central Update',
            style: TextStyle(color: Colors.black,fontSize: 20),
          ),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.redAccent,
            controller: controller.tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black.withOpacity(0.32),
            labelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),
            unselectedLabelStyle: TextStyle(fontSize: 12),
            tabs: controller.movieTabList.map((item) =>
              IconTab(
                label: movieTypeLabel[item],
                iconPath: movieTypeIcon[item],
              )).toList(),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: movieTabPage.values.toList(),
      ),
    );
  }
}
