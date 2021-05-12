import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:salon_app/app/data/model/posts_model.dart';
import 'package:salon_app/app/data/provider/myApiClient.dart';

class NotifyController extends GetxController {
  List<PostsModel> postsList = [];
  final pagingController = PagingController(
    // 2
    firstPageKey: 1,
  );

  //Total page loaded at time....
  static const _pageSize = 20;

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      callApi(pageKey: 1);
    });

    super.onInit();
  }

  callApi({callback, int pageKey = 1}) {
    MyApiClient().getPostsList(
      onSuccess: (posts) {
        print("==============");
        // postsList.clear();
        postsList.addAll(posts);

        //For BaseList do it in all
        final isLastPage = postsList.length < _pageSize;
        if (isLastPage) {
          pagingController.appendLastPage(postsList);
        } else {
          final nextPageKey = pageKey + postsList.length;
          pagingController.appendPage(postsList, nextPageKey);
        }
        // callback();
        update();
      },
      onError: (error) {
        print(error);
        pagingController.error = error;
        update();
        print("Error");
      },
    );
  }
}
