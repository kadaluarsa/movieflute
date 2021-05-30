import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:movieappget/core/domain/error/app_error.dart';
import '../../../core/view/data_wrapper.dart';
import '../domain/entity/movie_detail.dart';
import '../domain/usecase/retrieve_movie_detail.dart';

class MovieDetailController extends GetxController {
  int movieId;
  String movieName;
  final RetrieveMovieDetail movieDetail;
  final _movieDetail = Rx<DataWrapper<MovieDetail>>(DataWrapper.init());

  MovieDetailController(this.movieDetail);

  DataWrapper<MovieDetail> get movieDetailData => _movieDetail.value;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      movieId = Get.arguments['movieId'];
      movieName = Get.arguments['movieName'];
      Logger().d("anjin $movieId");
      _fetchDetailMovie(movieId);
    }
  }

  void _fetchDetailMovie(int movieId) {
    _movieDetail.value = DataWrapper.loading();
    movieDetail.execute(movieId).asStream().listen((data) {
      _movieDetail.value = DataWrapper.completed(data);
    }, onError: (error) {
      var unhandledError = error as UnhandledException;
      _movieDetail.value = DataWrapper.error(unhandledError.title);
    });
  }
}
