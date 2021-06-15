import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_getx/data/models/remote/post_comment_response.dart';
import 'package:test_getx/data/models/remote/post_response.dart';

part 'posts_source.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class PostsSource {
  factory PostsSource(Dio dio, {String baseUrl}) = _PostsSource;

  @GET("/posts")
  Future<List<PostResponse>> getPosts();

  @GET("/posts/{postId}")
  Future<PostResponse> getPost(@Path() String postId);

  @GET("/posts/{postId}/comments")
  Future<List<PostCommentResponse>> getPostComments(@Path() String postId);
}
