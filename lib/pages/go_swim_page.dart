import 'package:custombusstop/controller/go_swim_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoSwimPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("집 => 수영장"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 50,
            ),
            Text("집 => 수영장"),
            SizedBox(
              height: 20,
            ),
            Text("이번 차 : "),
            Obx(() => Text(
                Get.find<GoSwimControllerReactive>().resultStringa1.value)),
            SizedBox(
              height: 20,
            ),
            Text("다음 차 : "),
            Obx(() => Text(
                Get.find<GoSwimControllerReactive>().resultStringa2.value)),
            Container(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
