import 'package:movieappget/core/domain/usecase/error_handler.dart';
import 'package:movieappget/core/domain/usecase/use_case.dart';
import 'package:movieappget/feature/movie/domain/entity/movies.dart';
import 'package:movieappget/feature/shared/data/repository/movie_repository_impl.dart';

class RetrieveMoviePlaying extends UseCase<List<Results>, int> {
  final ErrorHandler errHandler;
  final MovieRepositoryImlp repository;

  RetrieveMoviePlaying(this.errHandler, this.repository);

  @override
  Future<List<Results>> build(int page) async {
    await repository.getMovieNowPlaying(page);
  }

  @override
  ErrorHandler errorHandler() => errHandler;
}
