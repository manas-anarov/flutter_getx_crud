import 'package:flutter_getx_crud/controllers/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPage extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  void _editPost(int id) {
    postController.edit(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text(
                'Edit Page',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: postController.editIdController,
                decoration: InputDecoration(hintText: 'id'),
              ),
              TextField(
                controller: postController.editTitleController,
                decoration: InputDecoration(hintText: 'title'),
              ),
              TextField(
                controller: postController.editBodyController,
                decoration: InputDecoration(hintText: 'body'),
              ),
              TextField(
                controller: postController.editUserIdController,
                decoration: InputDecoration(hintText: 'userId'),
              ),
              ElevatedButton(
                onPressed: () => _editPost(postController.postId.value),
                child: Text('Edit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
