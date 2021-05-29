

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieappget/feature/movie/domain/entity/movies.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  TabController tabController;
  final movieTabList = MovieType.values.toList();

}