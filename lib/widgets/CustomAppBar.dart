import 'package:arz3/controllers/ThemeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,

      toolbarHeight: 70,
      elevation: 5,
      title: const Text(
        "Where in the world?",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      actions: [
        GetBuilder<ThemeController>(
          builder:
              (controller) => TextButton.icon(
                onPressed: () {
                  controller.toggleTheme();
                },
                label: Text(
                  Get.isDarkMode ? "Light Mode" : "Dark Mode",
                  style: TextStyle(
                    color:
                        Get.isDarkMode
                            ? const Color.fromARGB(255, 51, 50, 50)
                            : const Color.fromARGB(255, 202, 195, 195),
                  ),
                ),
                icon: Icon(
                  Get.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
              ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
