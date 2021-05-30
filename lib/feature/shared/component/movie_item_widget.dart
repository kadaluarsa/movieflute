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
          Poster(
              'https://image.tmdb.org/t/p/w185'+movies.posterPath,
              MediaQuery
                  .of(context)
                  .size
                  .width / 2
          ),
          Text(
            movies.title,
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black12
            ),
          )
        ],
      ),
    );
  }
}