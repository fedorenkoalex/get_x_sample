import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:test_getx/data/source/posts_source.dart';

void bindSource() => Get.lazyPut<PostsSource>(() => PostsSource(Dio()));
