import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:movieappget/feature/detail/view/movie_detail_page.dart';
import 'package:movieappget/feature/movie/domain/entity/movies.dart';
import 'package:movieappget/feature/movie/domain/usecase/retrieve_now_playing.dart';

class NowPlayController extends GetxController
    with SingleGetTickerProviderMixin {
  bool isPopped = false;
  static const _pageSize = 20;
  final PagingController<int, Results> pagingController =
      PagingController(firstPageKey: 1);
  final RetrieveMoviePlaying nowPlaying;

  NowPlayController(this.nowPlaying);

  void onRefreshMovieList() {
    isPopped = true;
    pagingController.refresh();
    isPopped = false;
  }

  void onTapItem(Results movie) {
    Logger().e("anjin ${movie.id}");
    Get.toNamed(MovieDetailPage.routeName,
        arguments: {'movieId': movie.id, 'movieName': movie.title});
  }

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((currentPage) {
      retrieveMovieList(currentPage);
    });
  }

  void retrieveMovieList(int currentPage) {
    nowPlaying.execute(currentPage).asStream().listen((List<Results> list) {
      if (list.length < _pageSize) {
        pagingController.appendLastPage(list);
      } else {
        pagingController.appendPage(list, currentPage + 1);
      }
    }, onError: (error) {
      pagingController.error = error;
    });
  }

  @override
  void onClose() {
    isPopped = true;
    super.onClose();
  }
}
