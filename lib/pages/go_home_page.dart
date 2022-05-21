import 'package:custombusstop/controller/go_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("수영장 => 집"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 50,
            ),
            Text("수영장 => 집"),
            SizedBox(
              height: 20,
            ),
                Text("이번 차 : "),
                Obx(() => Text(
                    Get.find<GoHomeControllerReactive>().resultStringb1.value)),
            SizedBox(
              height: 20,
            ),
                Text("다음 차 : "),
                Obx(() => Text(
                    Get.find<GoHomeControllerReactive>().resultStringb2.value)),
          ],
        ),
      ),
    );
  }
}
