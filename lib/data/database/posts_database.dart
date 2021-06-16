import 'package:test_getx/data/database/base_database.dart';
import 'package:test_getx/data/models/local/post_model.dart';

class PostsDatabase extends BaseDatabase<PostModel> {
  @override
  String boxName = 'posts';

  Future<void> savePosts(List<PostModel> posts) async {
    posts.forEach((post) async {
      await addToBox(post);
    });
  }

  Future<PostModel> getPost(int postId) async {
    var list = await getItemsFromBox();
    return list.firstWhere((post) => (post.id == postId));
  }

  Future<List<PostModel>> getPosts() async => getItemsFromBox();

  Future<void> clearPosts() async => clearBox();
}
