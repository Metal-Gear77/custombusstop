import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("버스"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              child: SizedBox(height: 150, width: 200, child: Center(child: Text("수영장 => 집"))),
              onPressed: () {
                Get.toNamed("/GoHomePage");
              },
            ),
            ElevatedButton(
                child:
                    SizedBox(height: 150, width: 200, child: Center(child: Text("집 => 수영장"))),
                onPressed: () {
                  Get.toNamed("/GoSwimPage");
                })
          ],
        ),
      ),
    );
  }
}
