import 'package:flutter_getx_crud/pages/create_page.dart';
import 'package:flutter_getx_crud/pages/edit_page.dart';
import 'package:flutter_getx_crud/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Get X CRUD api',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/mainPage',
      getPages: [
        GetPage(name: '/mainPage', page: () => MainPage()),
        GetPage(name: '/addPage', page: () => CreatePage()),
        GetPage(name: '/editPage', page: () => EditPage()),
      ],
    );
  }
}
