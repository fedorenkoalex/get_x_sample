import 'package:get/get.dart';
import 'package:test_getx/bindings/controller_bindings/post_details_controller_bindings.dart';
import 'package:test_getx/bindings/controller_bindings/posts_list_controller_bindings.dart';
import 'package:test_getx/component/post_details/post_details_page.dart';
import 'package:test_getx/component/posts_list/posts_list_page.dart';

abstract class AppRoutes {
  static const ROOT = "/";
  static const POSTS_LIST = "/postsList";
  static const POST_DETAILS = "/postDetails";
}

abstract class AppPages {
  static const initial = AppRoutes.POSTS_LIST;

  static final routes = [
    GetPage(
      name: AppRoutes.POSTS_LIST,
      page: () => PostsListPage(),
      binding: PostsListControllerBindings(),
    ),
    GetPage(
        name: AppRoutes.POST_DETAILS,
        page: () => PostDetailsPage(),
        binding: PostDetailsControllerBindings())
  ];
}
