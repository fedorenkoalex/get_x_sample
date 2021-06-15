import 'package:test_getx/data/models/local/post.dart';

class PostsDatabase {
  Future<bool> savePosts(List<Post> posts) async {
    return Future.delayed(Duration(milliseconds: 200), () => true);
  }
}
