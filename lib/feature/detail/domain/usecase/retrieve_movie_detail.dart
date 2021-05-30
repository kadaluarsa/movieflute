import 'package:movieappget/core/domain/usecase/error_handler.dart';
import 'package:movieappget/core/domain/usecase/use_case.dart';
import 'package:movieappget/feature/detail/domain/entity/movie_detail.dart';
import 'package:movieappget/feature/shared/data/repository/movie_repository_impl.dart';

class RetrieveMovieDetail extends UseCase<MovieDetail, int> {
  final ErrorHandler errHandler;
  final MovieRepositoryImlp repository;

  RetrieveMovieDetail(this.errHandler, this.repository);

  @override
  Future<MovieDetail> build(int param) async {
    return await repository.getMovieDetail(param);
  }

  @override
  ErrorHandler errorHandler() => errHandler;
}
