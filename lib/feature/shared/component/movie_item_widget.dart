import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieappget/feature/movie/domain/entity/movies.dart';

import 'poster_widget.dart';

class MovieItemWidget extends StatelessWidget {
  final Function onTap;
  final Results movies;

  const MovieItemWidget({Key key, this.onTap, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Poster('https://image.tmdb.org/t/p/w185' + movies.posterPath,
              MediaQuery.of(context).size.width / 2),
          Center(
            child: Hero(
              child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    getText(movies),
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontStyle: FontStyle.normal),
                  )),
              tag: '${movies.title}',
            ),
          )
        ],
      ),
    );
  }
}

String getText(Results movies) {
  if (movies.title.length > 10) {
    return movies.title.substring(0, 10);
  } else {
    return movies.title;
  }
}
