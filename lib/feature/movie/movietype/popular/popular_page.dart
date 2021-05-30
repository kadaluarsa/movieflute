
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieappget/feature/movie/domain/entity/movies.dart';
import '../../../shared/component/movie_item_widget.dart';
import 'popular_page_controller.dart';

class PopularPage extends GetView<PopularController>{
  static const routeName = '/popular';

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
            itemBuilder: (context, item, index) =>
                MovieItemWidget(
                  onTap: () => controller.onTapItem(item),
                  movies: item,
                ),
          ),
        )
    );
  }
}