import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:movieappget/feature/detail/domain/entity/movie_cast.dart';
import 'package:movieappget/feature/detail/domain/entity/movie_detail.dart';
import 'package:movieappget/feature/detail/domain/entity/movie_image.dart';
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

  Future<MovieDetail> getMovieDetail(
      String apiKey, String language, int movieId) async {
    try {
      //[detail,image,cast]
      final result = await Future.wait([
        dio.get('movie/$movieId',
            queryParameters: {"api_key": apiKey, "language": language}),
        dio.get('movie/$movieId/credits',
            queryParameters: {"api_key": apiKey, "language": language}),
        dio.get('movie/$movieId/images',
            queryParameters: {"api_key": apiKey, "language": language})
      ]);
      final movies = MovieDetail.fromJson(result[0].data);
      movies.Caster =
          (result[1].data['cast'] as List).map((cast) => Cast.fromJson(cast)).toList();
      movies.movieImages = MovieImage.fromJson(result[2].data);
      return movies;
    } on DioError catch (e) {
      return e.error;
    }
  }
}
