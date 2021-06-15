import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/data/models/local/post.dart';
import 'package:test_getx/routes/routes.dart';

import 'posts_controller.dart';

class PostsListPage extends GetView<PostsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Obx(() {
        if (controller.isLoading.value) {
          return CircularProgressIndicator();
        }
        return ListView.separated(
          itemCount: controller.postList.value.length,
          itemBuilder: (context, position) {
            return _createTile(controller.postList.value[position]);
          },
          separatorBuilder: (context, position) {
            return Divider(
              height: 1,
              color: Colors.blueGrey,
            );
          },
        );
      })),
    );
  }

  _createTile(Post post) => ListTile(
        onTap: () {
          Get.toNamed(AppRoutes.POST_DETAILS, arguments: [post.id]);
        },
        title: Text(
          'post_title'.trParams({'postBody': post.title})!,
          style: TextStyle(
              color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          'post_description'.trParams({'postDescription': post.body})!,
          style: TextStyle(color: Colors.black, fontSize: 12.0),
        ),
      );
}
