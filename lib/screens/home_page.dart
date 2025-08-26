import 'package:arz3/controllers/DropdownButton%20.dart';
import 'package:arz3/controllers/ThemeController.dart';
import 'package:arz3/widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class HomePage extends StatelessWidget {
  final Dropdownbutton continentController = Get.put(Dropdownbutton());

  final ThemeController themeController = Get.put(ThemeController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
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
            SizedBox(height: 20),
            SizedBox(
              width: 200,

              child: Card(
                elevation: 6,
                child: Obx(
                  () => DropdownButtonFormField<String>(
                    value: continentController.defalt.value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 16,
                      ),
                    ),
                    onChanged:
                        (newValue) =>
                            continentController.defalt.value = newValue!,
                    items:
                        continentController.cont.map((continent) {
                          return DropdownMenuItem<String>(
                            value: continent,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 1),
                              child: Text(continent),
                            ),
                          );
                        }).toList(),
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
