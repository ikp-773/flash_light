// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flash_light/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final BulbController bulbController = Get.put(BulbController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: bulbController.flashState.value
            ? Color(0xffF7DD67)
            : Color(0xff3D3D3D),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: bulbController.flashState.value
                  ? Image.asset(
                      'assets/bulb_on.png',
                      width: 240,
                    )
                  : Image.asset(
                      'assets/bulb_off.png',
                      width: 370,
                    ),
            ),
            Spacer(),
            InkWell(
              customBorder: CircleBorder(),
              onTap: () {
                bulbController.switchState();
              },
              child: Container(
                height: 140,
                width: 140,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: bulbController.flashState.value
                        ? Colors.white38
                        : Color(0x30020202)),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: bulbController.flashState.value
                        ? Colors.white
                        : Colors.black54,
                  ),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: bulbController.flashState.value
                              ? Color(0xffF4D84F)
                              : Colors.white,
                          width: 3,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.power_settings_new_rounded,
                        color: bulbController.flashState.value
                            ? Color(0xffF4D84F)
                            : Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
