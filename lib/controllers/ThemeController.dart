// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  void toggleTheme() {
    if (Get.isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
    }
    update();
  }
}
