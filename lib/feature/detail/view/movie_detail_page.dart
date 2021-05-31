import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieappget/core/view/data_wrapper.dart';
import 'package:movieappget/feature/shared/asset_const.dart';
import '../domain/entity/movie_cast.dart';
import '../domain/entity/movie_detail.dart';
import 'movie_detail_controller.dart';
import '../../shared/component/error_widget.dart';
import '../../shared/component/loading_widget.dart';
import '../../shared/component/poster_widget.dart';

class MovieDetailPage extends GetView<MovieDetailController> {
  static const routeName = '/detail-movie';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (controller.movieDetailData.status) {
          case Status.loading:
            return Center(
              child: Container(
                width: 45,
                height: 45,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            );
            break;
          case Status.complete:
            final movie = controller.movieDetailData.data;
            return SingleChildScrollView(
              child: Column(
                children: [
                  MovieDetailHeader(movie),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Storyline(movie.overview),
                  ),
                  PhotoScroller(
                      ['https://image.tmdb.org/t/p/w185' + movie.posterPath],
                      180),
                  SizedBox(height: 20.0),
                  ActorScroller(movie.cast,80.0),
                  SizedBox(height: 50.0),
                ],
              ),
            );
            break;
          case Status.error:
            return Center(
              child: Text(controller.movieDetailData.message),
            );
            break;
          case Status.init:
            return SizedBox.shrink();
            break;
          default:
            return SizedBox.shrink();
        }
      }),
    );
  }
}

//header
class MovieDetailHeader extends StatelessWidget {
  MovieDetailHeader(this.movie);

  final MovieDetail movie;

  List<Widget> _buildCategoryChips(TextTheme textTheme) {
    return movie.genres.map((category) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Chip(
          label: Text(category.name),
          labelStyle: textTheme.caption,
          backgroundColor: Colors.black12,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    var movieInformation = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movie.title,
          style: textTheme.title,
        ),
        SizedBox(height: 8.0),
        RatingInformation(movie),
        SizedBox(height: 12.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: _buildCategoryChips(textTheme)),
        )
      ],
    );

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 140.0),
          child: ArcBannerImage(movie.backdropPath != null ?
              'https://image.tmdb.org/t/p/w300' + movie.backdropPath : ''),
        ),
        Positioned(
          bottom: 0.0,
          left: 16.0,
          right: 16.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Poster(movie.posterPath != null ? 'https://image.tmdb.org/t/p/w185' + movie.posterPath : '' , 180),
              SizedBox(width: 16.0),
              Expanded(child: movieInformation),
            ],
          ),
        ),
      ],
    );
  }
}

//storyline
class Storyline extends StatelessWidget {
  Storyline(this.storyline);

  final String storyline;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Story line',
          style: textTheme.subhead.copyWith(fontSize: 18.0),
        ),
        SizedBox(height: 8.0),
        Text(
          storyline,
          style: textTheme.body1.copyWith(
            color: Colors.black45,
            fontSize: 16.0,
          ),
        ),
        // No expand-collapse in this tutorial, we just slap the "more"
        // button below the text like in the mockup.
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'more',
              style: textTheme.body1
                  .copyWith(fontSize: 16.0, color: theme.accentColor),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 18.0,
              color: theme.accentColor,
            ),
          ],
        ),
      ],
    );
  }
}

//photoscroller
class PhotoScroller extends StatelessWidget {
  PhotoScroller(this.photoUrls, this.height);

  final List<String> photoUrls;
  static const POSTER_RATIO = 0.7;
  final double height;

  Widget _buildPhoto(BuildContext context, int index) {
    var photo = photoUrls[index];
    var width = POSTER_RATIO * height;
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: CachedNetworkImage(
          height: height,
          width: width,
          fit: BoxFit.cover,
          imageUrl: photo,
          placeholder: (context, url) => LoadingIndicator(),
          errorWidget: (context, url, error) => ErrorImage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Photos',
            style: textTheme.subhead.copyWith(fontSize: 18.0),
          ),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(100.0),
          child: ListView.builder(
            itemCount: photoUrls.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 8.0, left: 20.0),
            itemBuilder: _buildPhoto,
          ),
        ),
      ],
    );
  }
}

//actor
class ActorScroller extends StatelessWidget {
  ActorScroller(this.actors, this.height);

  final double height;
  static const ava_ratio = 1.0;

  final List<Cast> actors;

  Widget _buildActor(BuildContext ctx, int index) {
    var actor = actors[index];
    var width = ava_ratio * height;

    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          ClipOval(
            child: CachedNetworkImage(
              height: height,
              width: width,
              fit: BoxFit.cover,
              imageUrl: getProfileImage(actor),
              placeholder: (context, url) => LoadingIndicator(),
              errorWidget: (context, url, error) => ErrorImage(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(actor.name),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Actors',
            style: textTheme.subhead.copyWith(fontSize: 18.0),
          ),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(120.0),
          child: ListView.builder(
            itemCount: actors.length > 5 ? 5 : actors.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 12.0, left: 20.0),
            itemBuilder: _buildActor,
          ),
        ),
      ],
    );
  }

  String getProfileImage(Cast actor) => actor.profilePath != null ? 'https://image.tmdb.org/t/p/w185${actor.profilePath}' : 'https://avatars.githubusercontent.com/u/10069565?v=4';
}

//banner
class ArcBannerImage extends StatelessWidget {
  ArcBannerImage(this.imageUrl);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return ClipPath(
      clipper: ArcClipper(),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: screenWidth,
        height: 230.0,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

//rating

class RatingInformation extends StatelessWidget {
  RatingInformation(this.movie);

  final MovieDetail movie;

  Widget _buildRatingBar(ThemeData theme) {
    var stars = <Widget>[];

    for (var i = 1; i <= 5; i++) {
      var color = i <= movie.voteCount ? theme.accentColor : Colors.black12;
      var star = Icon(
        Icons.star,
        color: color,
      );

      stars.add(star);
    }

    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var ratingCaptionStyle = textTheme.caption.copyWith(color: Colors.black45);

    var numericRating = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          movie.voteCount.toString(),
          style: textTheme.title.copyWith(
            fontWeight: FontWeight.w400,
            color: theme.accentColor,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          'Ratings',
          style: ratingCaptionStyle,
        ),
      ],
    );

    var starRating = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildRatingBar(theme),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 4.0),
          child: Text(
            'Grade now',
            style: ratingCaptionStyle,
          ),
        ),
      ],
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        numericRating,
        SizedBox(width: 16.0),
        starRating,
      ],
    );
  }
}
