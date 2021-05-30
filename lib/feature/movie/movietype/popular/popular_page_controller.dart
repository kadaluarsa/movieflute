import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:movieappget/feature/movie/domain/usecase/retrieve_popular.dart';
import 'package:movieappget/feature/shared/api_const.dart';
import '../../../detail/view/movie_detail_page.dart';
import '../../domain/entity/movies.dart';

class PopularController extends GetxController {
  bool isPopped = false;
  static const _pageSize = 20;
  final PagingController<int, Results> pagingController =
      PagingController(firstPageKey: 1);
  final RetrievePopularMovie popularMovie;

  PopularController(this.popularMovie);

  void onRefreshMovieList() {
    isPopped = true;
    pagingController.refresh();
    isPopped = false;
  }

  onTapItem(item) {
    Get.toNamed(MovieDetailPage.routeName);
  }

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((currentPage) {
      retrieveMovieList(currentPage);
    });
  }

  void retrieveMovieList(int currentPage) {
    popularMovie
        .execute(currentPage)
        .then((value) => pagingController.appendPage(value, currentPage + 1));
    // popularMovie.execute(currentPage).asStream().listen((List<Results> list) {
    //   pagingController.appendPage(list, currentPage + 1);
    // }, onError: (error) {
    //   pagingController.error = error;
    // });
  }

  @override
  void onClose() {
    isPopped = true;
    super.onClose();
  }
}
