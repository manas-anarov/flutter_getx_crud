import 'package:flutter_getx_crud/controllers/post_controller.dart';

import 'package:flutter_getx_crud/pages/create_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  Future<void> _pullRefresh() async {
    postController.getList();
  }

  Future<void> _onDelete(int id) async {
    postController.delete(id);
  }

  Future<void> _onEdit(int id) async {
    postController.postId.value = id;
    postController.toEditPage();
  }

  Future<void> _onDetail(int id) async {
    postController.postId.value = id;
    postController.toDetailPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => RefreshIndicator(
            onRefresh: _pullRefresh,
            child: Stack(
              children: [
                Column(
                  children: [
                    Text(
                      "Main Page",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      child: Expanded(
                        child: ListView(
                          children: postController.listPosts.map((postItem) {
                            var index =
                                postController.listPosts.indexOf(postItem);
                            print(postController.listPosts.toString());
                            index++;
                            return Container(
                              height: 50,
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(child: Text(index.toString())),
                                      SizedBox(width: 10),
                                      Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                                onTap: () =>
                                                    _onDetail(postItem.id),
                                                child: Text(
                                                  postItem.title
                                                              .toString()
                                                              .length >
                                                          30
                                                      ? postItem.title
                                                              .toString()
                                                              .substring(
                                                                  0, 30) +
                                                          '...'
                                                      : postItem.title
                                                          .toString(),
                                                )),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                          onTap: () => _onEdit(postItem.id),
                                          child: Icon(Icons.edit,
                                              color: Colors.blue)),
                                      SizedBox(width: 5),
                                      GestureDetector(
                                          onTap: () => _onDelete(postItem.id),
                                          child: Icon(Icons.delete,
                                              color: Colors.red)),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 1,
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: FloatingActionButton(
                      backgroundColor: Colors.orange,
                      child: Icon(Icons.add),
                      onPressed: () {
                        Get.to(() => CreatePage());
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
