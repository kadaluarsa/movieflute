import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'domain/entity/movies.dart';

class MovieNavigationParam {
  final String type;

  MovieNavigationParam(this.type);
}

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  TabController tabController;
  final movieTabList = MovieType.values.toList();

  @override
  void onInit() {
    var movieParam = Get.arguments as MovieNavigationParam;
    var transactionType = movieParam != null && movieParam.type != null
        ? movieParam.type
        : movieTabList.first;
    tabController = TabController(length: movieTabList.length, vsync: this);
    if (movieTabList != null) {
      tabController.index = movieTabList.indexOf(transactionType);
    }
    super.onInit();
  }
}
