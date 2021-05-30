import 'package:get/get.dart';

class MovieDetailController extends GetxController {
  String movieId;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      movieId = Get.arguments['movieId'];
    }
    _fetchDetailMovie();
  }


  void _fetchDetailMovie(){

  }
}
