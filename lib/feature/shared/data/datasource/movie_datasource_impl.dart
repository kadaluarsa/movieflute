import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:movieappget/feature/detail/domain/entity/movie_detail.dart';
import 'package:movieappget/feature/movie/domain/entity/movies.dart';

class MovieDatasourceImpl {
  final Dio dio;

  MovieDatasourceImpl(this.dio);

  Future<List<Results>> getMovieNowPlaying(
      String apiKey, String language, int page) async {
    try {
      final response = await dio.get("movie/now_playing", queryParameters: {
        "api_key": apiKey,
        "language": language,
        "page": page
      });
      return (response.data['results'] as List)
          .map((data) => Results.fromJson(data))
          .toList();
    } on DioError catch (e) {
      Logger().e("wow error $e");
      return e.error;
    }
  }

  Future<List<Results>> getMoviePopular(
      String apiKey, String language, int page) async {
    try {
      final response = await dio.get("movie/popular", queryParameters: {
        "api_key": apiKey,
        "language": language,
        "page": page
      });
      return (response.data['results'] as List)
          .map((data) => Results.fromJson(data))
          .toList();
    } on DioError catch (e) {
      Logger().e("wow error $e");
      return e.error;
    }
  }

  Future<Movie_detail> getMovieDetail(String movieId) async {
    try {
      final response = await dio.get('movie/$movieId');
      return Movie_detail.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }
}
