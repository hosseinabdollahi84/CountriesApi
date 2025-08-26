import 'package:arz3/controllers/ThemeController.dart';
import 'package:arz3/widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class HomePage extends StatelessWidget {
  final List<String> cont = ["Africa", "Asia", "Europe", "America", "Oceania"];

  final ThemeController themeController = Get.put(ThemeController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 1,
                      offset: Offset(1, 3),
                    ),
                  ],
                ),

                width: MediaQuery.of(context).size.width * 0.9,
                child: Material(
                  elevation: 6,
                  borderRadius: BorderRadius.circular(12),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search for a country...",

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
