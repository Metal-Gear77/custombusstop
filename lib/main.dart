import 'package:custombusstop/controller/go_home_controller.dart';
import 'package:custombusstop/controller/go_swim_controller.dart';
import 'package:custombusstop/pages/go_home_page.dart';
import 'package:custombusstop/pages/go_swim_page.dart';
import 'package:custombusstop/pages/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '버스',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
            bodyText1: TextStyle(fontSize: 25),
        bodyText2: TextStyle(fontSize: 25),
button: TextStyle(fontSize: 25)
        )
      ),
      initialRoute: "/",
      getPages: [
        GetPage(
            name: "/",
            page: () => MainPage()
        ),
        GetPage(
            name: "/GoHomePage",
            page: () => GoHomePage(),
            binding: BindingsBuilder(() {
              Get.put(GoHomeControllerReactive());
            })),
        GetPage(
            name: "/GoSwimPage",
            page: () => GoSwimPage(),
            binding: BindingsBuilder(() {
              Get.put(GoSwimControllerReactive());
            }))
      ],
    );
  }
}
