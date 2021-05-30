
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../shared/component/movie_item_widget.dart';
import 'popular_page_controller.dart';

class PopularPage extends GetView<PopularController>{
  static const routeName = '/popular';

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () => Future.sync(() => controller.onRefreshMovieList()),
        child: PagedListView(
          pagingController: controller.pagingController,
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