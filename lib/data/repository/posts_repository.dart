import 'package:dio/dio.dart';
import 'package:test_getx/data/database/posts_database.dart';
import 'package:test_getx/data/models/local/post.dart';
import 'package:test_getx/data/models/local/post_details.dart';
import 'package:test_getx/data/models/mapper/post_mapper.dart';
import 'package:test_getx/data/models/remote_response.dart';
import 'package:test_getx/data/source/posts_source.dart';

class PostsRepository {
  final PostsSource _postsSource;
  final PostsDatabase _postsDatabase;

  PostsRepository(this._postsSource, this._postsDatabase);

  Future<RemoteResponse<List<Post>>> getPosts() async {
    try {
      var response = await _postsSource.getPosts();
      var posts = mapPosts(response);
      //_postsDatabase.savePosts(response);
      return RemoteResponse.success(posts);
    } on DioError catch (error) {
      return RemoteResponse.error(error.type.index, error.message);
    } on Exception catch (exception) {
      return RemoteResponse.error(-1, "Internal error");
    }
  }

  Future<RemoteResponse<PostDetails>> getPostDetails(String postId) async {
    try {
      var postResponse = await _postsSource.getPost(postId);
      var posts = mapPost(postResponse);
      var commentsResponse = await _postsSource.getPostComments(postId);
      var comments = mapComments(commentsResponse);
      return RemoteResponse.success(PostDetails(posts, comments));
    } on DioError catch (error) {
      return RemoteResponse.error(error.type.index, error.message);
    } on Exception catch (exception) {
      return RemoteResponse.error(-1, "Internal error");
    }
  }
}
