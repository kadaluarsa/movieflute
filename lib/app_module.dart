
import 'package:get/get.dart';

class MovieAppModule extends Bindings {
  @override
  void dependencies() {
    const baseUrl = String.fromEnvironment('BASE_URL',
        defaultValue : 'https://api.themoviedb.org/3/');
  }
}