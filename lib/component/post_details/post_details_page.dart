import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/data/models/local/comment.dart';

import 'post_details_controller.dart';

class PostDetailsPage extends GetView<PostDetailsController> {
  @override
  Widget build(BuildContext context) {
    var postId = Get.arguments[0] as int;
    controller.getPostDetails(postId);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            if (controller.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            var post = controller.postDetails.value;
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'post_title'.trParams({'postBody': post.post.title})!,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  'post_description'
                      .trParams({'postDescription': post.post.body})!,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text('comments'.tr),
                ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, position) {
                      return _createTile(post.comments[position]);
                    },
                    separatorBuilder: (context, position) {
                      return Divider(
                        height: 1,
                        color: Colors.blueGrey,
                      );
                    },
                    itemCount: post.comments.length)
              ],
            );
          }),
        ),
      ),
    );
  }

  _createTile(Comment comment) => ListTile(
        title: Text(
          comment.email,
          style: TextStyle(
              color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          comment.body,
          style: TextStyle(color: Colors.black, fontSize: 12.0),
        ),
      );
}
