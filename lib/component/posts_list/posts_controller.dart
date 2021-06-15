import 'package:get/get.dart';
import 'package:test_getx/data/models/local/post.dart';
import 'package:test_getx/data/models/remote_response.dart';
import 'package:test_getx/data/repository/posts_repository.dart';

class PostsController extends GetxController {
  final PostsRepository loginRepository;

  PostsController(this.loginRepository);

  final isLoading = false.obs;
  final postList = RxList<Post>.empty(growable: true).obs;

  @override
  Future<void> onReady() async {
    _getPosts();
  }

  Future<void> _getPosts() async {
    isLoading.value = true;
    var posts = await loginRepository.getPosts();
    print("Posts Result: ${posts.toString()}");
    isLoading.value = false;
    if (posts is RemoteResponseSuccess<List<Post>>) {
      postList.value.clear();
      postList.value.addAll(posts.data);
      isLoading.value = false;
    } else if (posts is RemoteResponseError<List<Post>>) {
      print("Login Error: ${posts.message}");
      postList.value.clear();
      isLoading.value = false;
    }
  }
}
