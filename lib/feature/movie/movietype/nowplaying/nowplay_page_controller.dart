

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieappget/feature/detail/view/movie_detail_page.dart';
import 'package:movieappget/feature/movie/domain/entity/movies.dart';
import 'package:movieappget/feature/movie/home_page.dart';

class NowPlayController extends GetxController with SingleGetTickerProviderMixin{

  bool isPopped = false;
  static const _pageSize = 20;
  final PagingController<int, Movies> pagingController =
  PagingController(firstPageKey: 1);

  void onRefreshMovieList(){
    isPopped = true;
  }

  onTapItem(item) {
    Get.toNamed(MovieDetailPage.routeName);
  }

}
