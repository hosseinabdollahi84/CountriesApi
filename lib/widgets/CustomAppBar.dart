import 'package:arz3/controllers/ThemeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        Obx(() {
          final themeController = Get.find<ThemeController>();
          final isDark = themeController.themeMode.value == ThemeMode.dark;

          return TextButton.icon(
            onPressed: () => themeController.toggleTheme(),
            label: Text(
              isDark ? "Light Mode" : "Dark Mode",
              style: TextStyle(
                color:
                    isDark
                        ? const Color.fromARGB(255, 201, 193, 193)
                        : const Color.fromARGB(255, 37, 34, 34),
              ),
            ),
            icon: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              color:
                  isDark
                      ? const Color.fromARGB(255, 247, 241, 241)
                      : const Color.fromARGB(255, 24, 22, 22),
            ),
          );
        }),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
