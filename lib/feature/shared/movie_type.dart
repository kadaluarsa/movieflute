import '../movie/domain/entity/movies.dart';
import 'asset_const.dart';

const API_KEY = '7185bd80341e2f2880fcb94cd9e61f43';

final movieTypeLabel = {
  MovieType.nowplaying: 'Now Playing',
  MovieType.popular: 'Popular'
};

final movieTypeIcon = {
  MovieType.nowplaying: nowplayIcon,
  MovieType.popular: popularIcon
};
