import 'package:test_getx/data/models/local/comment.dart';
import 'package:test_getx/data/models/mapper/base_mapper.dart';
import 'package:test_getx/data/models/remote/post_comment_response.dart';

class CommentsMapper extends BaseMapper<Comment, PostCommentResponse> {
  @override
  Comment responseToUi(PostCommentResponse response) => Comment(
      response.userId ?? -1,
      response.id ?? -1,
      response.name ?? "",
      response.email ?? "",
      response.body ?? "");
}
