import 'package:get/get.dart';
import 'package:test_getx/data/models/local/post.dart';
import 'package:test_getx/data/models/local/post_details.dart';
import 'package:test_getx/data/models/remote_response.dart';
import 'package:test_getx/data/repository/posts_repository.dart';

class PostDetailsController extends GetxController {
  final PostsRepository loginRepository;

  PostDetailsController(this.loginRepository);

  final isLoading = false.obs;
  final postDetails = PostDetails.empty().obs;

  Future<void> getPostDetails(String postId) async {
    isLoading.value = true;
    var postDetailsResult = await loginRepository.getPostDetails(postId);
    print("Post Result: ${postDetails.toString()}");
    isLoading.value = false;
    if (postDetailsResult is RemoteResponseSuccess<PostDetails>) {
      postDetails.value = postDetailsResult.data;
      isLoading.value = false;
    } else if (postDetailsResult is RemoteResponseError<PostDetails>) {
      print("Login Error: ${postDetailsResult.message}");
      isLoading.value = false;
    }
  }
}
