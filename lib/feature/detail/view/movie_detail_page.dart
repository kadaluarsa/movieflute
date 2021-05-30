
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieappget/feature/detail/view/movie_detail_controller.dart';

class MovieDetailPage extends GetView<MovieDetailController>{

  static const routeName = '/detail-movie';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Movie'),
      ),
    );
  }
}