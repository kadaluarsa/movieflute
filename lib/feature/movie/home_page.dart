import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'domain/entity/movies.dart';
import 'home_controller.dart';
import 'movietype/nowplaying/nowplay_page.dart';
import 'movietype/popular/popular_page.dart';
import '../shared/component/icon_tab.dart';
import '../shared/movie_type.dart';

class KeepAliveWrapper extends StatefulWidget {
  final Widget child;

  const KeepAliveWrapper({Key key, this.child}) : super(key: key);

  @override
  __KeepAliveWrapperState createState() => __KeepAliveWrapperState();
}

class __KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}

class MovieHomePage extends GetView<HomeController> {
  static const routeName = '/home';

  final movieTabPage = {
    MovieType.nowplaying : KeepAliveWrapper(child : NowPlayPage()),
    MovieType.popular : KeepAliveWrapper(child: PopularPage())
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
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
