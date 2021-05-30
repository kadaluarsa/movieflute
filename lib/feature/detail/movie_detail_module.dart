import 'package:get/get.dart';
import 'package:movieappget/core/domain/usecase/error_handler.dart';
import 'package:movieappget/feature/detail/domain/usecase/retrieve_movie_detail.dart';
import 'package:movieappget/feature/detail/view/movie_detail_controller.dart';
import 'package:movieappget/feature/shared/data/repository/movie_repository_impl.dart';

class MovieDetailModule extends Bindings {
  @override
  void dependencies() {
    Get.put(RetrieveMovieDetail(
        Get.find<ErrorHandler>(), Get.find<MovieRepositoryImlp>()));
    Get.put(MovieDetailController(Get.find<RetrieveMovieDetail>()));
  }
}
