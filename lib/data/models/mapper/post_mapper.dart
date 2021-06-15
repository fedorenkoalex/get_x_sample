import 'package:test_getx/data/models/local/comment.dart';
import 'package:test_getx/data/models/local/post.dart';
import 'package:test_getx/data/models/remote/post_comment_response.dart';
import 'package:test_getx/data/models/remote/post_response.dart';

Post mapPost(PostResponse post) =>
    Post(
        post.userId ?? -1, post.id ?? -1, post.title ?? "", post.body ?? "");

List<Post> mapPosts(List<PostResponse> posts) =>
    posts
        .map((post) =>
        Post(
            post.userId ?? -1, post.id ?? -1, post.title ?? "",
            post.body ?? ""))
        .toList();

List<Comment> mapComments(List<PostCommentResponse> comments) =>
    comments
        .map((post) =>
        Comment(post.userId ?? -1, post.id ?? -1, post.name ?? "",
            post.email ?? "", post.body ?? ""))
        .toList();
