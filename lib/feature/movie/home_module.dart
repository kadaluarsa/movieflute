import 'package:get/get.dart';
import 'package:movieappget/feature/shared/data/repository/movie_repository_impl.dart';
import '../../core/domain/usecase/error_handler.dart';
import 'home_controller.dart';

import 'domain/usecase/retrieve_popular.dart';
import 'movietype/nowplaying/nowplay_page_controller.dart';
import 'movietype/popular/popular_page_controller.dart';

class HomeModule extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(RetrievePopularMovie(
        Get.find<ErrorHandler>(), Get.find<MovieRepositoryImlp>()));
    Get.put(PopularController(Get.find<RetrievePopularMovie>()));
    // Get.put(NowPlayController());
  }
}
