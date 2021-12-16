import 'package:flutter_getx_crud/controllers/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  void _detailPost(int id) {
    postController.detail(id);
  }

  @override
  Widget build(BuildContext context) {
    _detailPost(postController.postId.value);

    return Scaffold(body: SafeArea(child: Obx(() {
      return Column(children: [
        Text(
          "Detail Page",
          style: TextStyle(
              fontSize: 25, color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        Text(
          "Title: ${postController.postDetail.value.title}",
          style: TextStyle(
              fontSize: 25, color: Colors.red, fontWeight: FontWeight.bold),
        ),
        Text(
          "Body: ${postController.postDetail.value.body}",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(
          "ID: ${postController.postDetail.value.id}",
          style: TextStyle(
              fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ]);
    })));
  }
}
