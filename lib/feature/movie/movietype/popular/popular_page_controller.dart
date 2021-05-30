import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../domain/usecase/retrieve_popular.dart';
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

  void onTapItem(Results movie) => Get.toNamed(MovieDetailPage.routeName,
        arguments: {'movieId': movie.id, 'movieName': movie.title});


  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((currentPage) {
      retrieveMovieList(currentPage);
    });
  }

  void retrieveMovieList(int currentPage) {
    popularMovie.execute(currentPage).asStream().listen((List<Results> list) {
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
