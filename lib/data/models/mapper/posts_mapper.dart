import 'package:test_getx/data/models/local/post.dart';
import 'package:test_getx/data/models/local/post_model.dart';
import 'package:test_getx/data/models/remote/post_response.dart';

import 'base_db_mapper.dart';

class PostsMapper extends BaseDbMapper<Post, PostResponse, PostModel> {
  @override
  Post dbToUi(PostModel dbModel) =>
      Post(dbModel.id, dbModel.title, dbModel.body);

  @override
  PostModel responseToDb(PostResponse response) => PostModel()
    ..id = response.id ?? -1
    ..userId = response.userId ?? -1
    ..title = response.title ?? ""
    ..body = response.body ?? "";

  @override
  Post responseToUi(PostResponse response) =>
      Post(response.id ?? -1, response.title ?? "", response.body ?? "");
}
