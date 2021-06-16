import 'package:dio/dio.dart';
import 'package:test_getx/data/database/posts_database.dart';
import 'package:test_getx/data/models/local/comment.dart';
import 'package:test_getx/data/models/local/post.dart';
import 'package:test_getx/data/models/local/post_details.dart';
import 'package:test_getx/data/models/local/post_model.dart';
import 'package:test_getx/data/models/mapper/base_db_mapper.dart';
import 'package:test_getx/data/models/mapper/base_mapper.dart';
import 'package:test_getx/data/models/mapper/comments_mapper.dart';
import 'package:test_getx/data/models/mapper/posts_mapper.dart';
import 'package:test_getx/data/models/remote/post_comment_response.dart';
import 'package:test_getx/data/models/remote/post_response.dart';
import 'package:test_getx/data/models/remote_response.dart';
import 'package:test_getx/data/source/posts_source.dart';

class PostsRepository {
  final PostsSource _postsSource;
  final PostsDatabase _postsDatabase;
  final BaseDbMapper<Post, PostResponse, PostModel> _postMapper = PostsMapper();
  final BaseMapper<Comment, PostCommentResponse> _commentMapper =
      CommentsMapper();

  PostsRepository(this._postsSource, this._postsDatabase);

  Future<RemoteResponse<List<Post>>> getPosts() async {
    try {
      var cachedPosts = await _postsDatabase.getPosts();
      print("Got ${cachedPosts.length} posts from DB");
      if (cachedPosts.isNotEmpty) {
        var uiPosts =
            cachedPosts.map((dbModel) => _postMapper.dbToUi(dbModel)).toList();
        return RemoteResponse.success(uiPosts);
      }
      var response = await _postsSource.getPosts();
      var dbPosts = response
          .map((response) => _postMapper.responseToDb(response))
          .toList();
      _postsDatabase.savePosts(dbPosts);
      var uiPosts =
          dbPosts.map((dbModel) => _postMapper.dbToUi(dbModel)).toList();
      return RemoteResponse.success(uiPosts);
    } on DioError catch (error) {
      return RemoteResponse.error(error.type.index, error.message);
    } on Exception catch (exception) {
      return RemoteResponse.error(-1, "Internal error");
    }
  }

  Future<RemoteResponse<PostDetails>> getPostDetails(int postId) async {
    try {
      var postModel = await _postsDatabase.getPost(postId);
      var postsUi = _postMapper.dbToUi(postModel);
      var commentsResponse = await _postsSource.getPostComments(postId);
      var commentsUi = commentsResponse
          .map((comment) => _commentMapper.responseToUi(comment))
          .toList();
      return RemoteResponse.success(PostDetails(postsUi, commentsUi));
    } on DioError catch (error) {
      return RemoteResponse.error(error.type.index, error.message);
    } on Exception catch (exception) {
      return RemoteResponse.error(-1, "Internal error");
    }
  }
}
