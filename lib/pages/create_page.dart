import 'package:flutter_getx_crud/controllers/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePage extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  void _createPost() {
    postController.create();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text(
                'Create Post',
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: postController.createTitleController,
                decoration: InputDecoration(hintText: 'title'),
              ),
              TextField(
                controller: postController.createBodyController,
                decoration: InputDecoration(hintText: 'body'),
              ),
              TextField(
                controller: postController.createUserIdController,
                decoration: InputDecoration(hintText: 'userId'),
              ),
              ElevatedButton(
                onPressed: () => _createPost(),
                child: Text('Create'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
