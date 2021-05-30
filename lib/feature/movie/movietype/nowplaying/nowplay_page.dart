import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:movieappget/feature/movie/domain/entity/movies.dart';
import 'package:movieappget/feature/movie/movietype/nowplaying/nowplay_page_controller.dart';
import 'package:movieappget/feature/shared/component/movie_item_widget.dart';

class NowPlayPage extends GetView<NowPlayController> {
  static const routeName = '/nowplay';

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () => Future.sync(() => controller.onRefreshMovieList()),
        child: PagedGridView(
          pagingController: controller.pagingController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 100 / 190,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
          ),
          builderDelegate: PagedChildBuilderDelegate(
            firstPageProgressIndicatorBuilder: (context) => Center(
              child: Container(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                ),
              ),
            ),
            itemBuilder: (context, item, index) => MovieItemWidget(
              onTap: () => controller.onTapItem(item),
              movies: item,
            ),
          ),
        ));
  }
}
