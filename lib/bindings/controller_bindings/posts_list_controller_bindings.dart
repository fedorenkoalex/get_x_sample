import 'package:get/get.dart';
import 'package:test_getx/bindings/controllers.dart';
import 'package:test_getx/bindings/database.dart';
import 'package:test_getx/bindings/repository.dart';
import 'package:test_getx/bindings/source.dart';

class PostsListControllerBindings extends Bindings {
  @override
  void dependencies() {
    bindSource();
    bindDatabase();
    bindRepository();
    bindingPostsListController();
  }
}
