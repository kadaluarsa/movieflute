import 'package:logger/logger.dart';
import 'package:movieappget/feature/detail/domain/entity/movie_detail.dart';
import 'package:movieappget/feature/movie/domain/entity/movies.dart';
import 'package:movieappget/feature/shared/api_const.dart';
import 'package:movieappget/feature/shared/data/datasource/movie_datasource_impl.dart';

class MovieRepositoryImlp {
  final MovieDatasourceImpl _datasource;

  MovieRepositoryImlp(this._datasource);

  @override
  Future<MovieDetail> getMovieDetail(int movieId) async {
    var data = await _datasource.getMovieDetail(
        ApiConstant.apiKey, ApiConstant.language, movieId);
    return data;
  }

  @override
  Future<List<Results>> getMovieNowPlaying(int page) async {
    var data = await _datasource.getMovieNowPlaying(
        ApiConstant.apiKey, ApiConstant.language, page);
    return data;
  }

  @override
  Future<List<Results>> getMoviePopular(int page) async {
    var data = await _datasource.getMoviePopular(
        ApiConstant.apiKey, ApiConstant.language, page);
    return data;
  }
}
