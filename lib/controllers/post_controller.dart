import 'dart:convert';

import 'package:flutter_getx_crud/model/post.dart';
import 'package:flutter_getx_crud/pages/detail_page.dart';
import 'package:flutter_getx_crud/pages/edit_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_crud/utils/internet.dart';

class PostController extends GetxController {
  RxBool loading = false.obs;
  Map<String, dynamic> body;
  RxList<Post> listPosts = <Post>[].obs;
  var postDetail = Post().obs;

  TextEditingController createTitleController = TextEditingController();
  TextEditingController createBodyController = TextEditingController();
  TextEditingController createUserIdController = TextEditingController();

  TextEditingController editIdController = TextEditingController();
  TextEditingController editTitleController = TextEditingController();
  TextEditingController editBodyController = TextEditingController();
  TextEditingController editUserIdController = TextEditingController();

  RxInt postId = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getList();
  }

  void toEditPage() async {
    Get.to(() => EditPage());
  }

  void toDetailPage() async {
    Get.to(() => DetailPage());
  }

  void getList() async {
    HttpConnect request = HttpConnect(url: "posts/");
    request.list().then((value) {
      if (value.statusCode == 200) {
        final responseJson = jsonDecode(value.body);
        List jsonResponse = responseJson;
        listPosts.value = jsonResponse.map((e) => Post.fromJson(e)).toList();
        print("LIST");
        print(body);
      } else {
        print('LIST ERROR');
      }
    }).catchError((onError) {
      printError();
    });
  }

  void detail(int id) async {
    HttpConnect request = HttpConnect(url: 'posts/$id/');
    request.detail().then((value) {
      body = jsonDecode(value.body);
      if (value.statusCode == 200) {
        postDetail.value = Post.fromJson(body);
        print("DETAIL");
        print(body);
      } else {
        print('DETAIL ERROR');
      }
    }).catchError((onError) {
      printError();
    });
  }

  void delete(int id) async {
    HttpConnect request = HttpConnect(url: 'posts/$id/');
    request.delete().then((value) {
      body = jsonDecode(value.body);
      if (value.statusCode == 200) {
        print("DELETE");
        print(body);
      } else {
        print('DELETE ERROR');
      }
    }).catchError((onError) {
      printError();
    });
  }

  void edit(int id) async {
    HttpConnect request = HttpConnect(
        url: 'posts/$id/',
        body: jsonEncode(<String, dynamic>{
          'id': editIdController.text,
          'title': editTitleController.text,
          'body': editBodyController.text,
          'userId': editUserIdController.text,
        }));

    request.edit().then((value) {
      body = jsonDecode(value.body);
      if (value.statusCode == 200) {
        print("EDIT");
        print(body);
        Get.back();
      } else {
        print('EDIT ERROR');
      }
    }).catchError((onError) {
      printError();
    });
  }

  void create() async {
    HttpConnect request = HttpConnect(
        url: 'posts',
        body: jsonEncode(<String, dynamic>{
          'title': createTitleController.text,
          'body': createBodyController.text,
          'userId': createUserIdController.text,
        }));
    request.create().then((value) {
      body = jsonDecode(value.body);
      if (value.statusCode == 201) {
        print("CREATED");
        print(body);
        Get.back();
      } else {
        print("CREATED ERROR");
      }
    }).catchError((onError) {
      printError();
    });
  }
}
