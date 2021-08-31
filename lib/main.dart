import 'package:api_mediqo_flutter/pages/edit_game_page.dart';
import 'package:api_mediqo_flutter/pages/home_page.dart';
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
      title: 'Mediqo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/homePage',
      getPages: [
        GetPage(name: '/homePage', page: () => HomePage()),
        GetPage(name: '/editPage', page: () => EditGamePage()),
      ],
    );
  }
}
