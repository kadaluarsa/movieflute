import 'package:movieappget/core/domain/usecase/error_handler.dart';
import 'package:movieappget/core/domain/usecase/use_case.dart';
import 'package:movieappget/feature/detail/domain/entity/movie_detail.dart';
import 'package:movieappget/feature/shared/data/datasource/movie_datasource_impl.dart';

class RetrieveMovieDetail extends UseCase<Movie_detail, String> {
  final ErrorHandler errHandler;
  final MovieDatasourceImpl repository;

  RetrieveMovieDetail(this.errHandler, this.repository);

  @override
  Future<Movie_detail> build(String param) async {
    await repository.getMovieDetail(param);
  }

  @override
  ErrorHandler errorHandler() => errHandler;
}
