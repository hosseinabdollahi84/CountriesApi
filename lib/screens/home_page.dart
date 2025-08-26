import 'package:arz3/controllers/DropdownButton%20.dart';
import 'package:arz3/controllers/ThemeController.dart';
import 'package:arz3/controllers/services_api.dart';
import 'package:arz3/widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class HomePage extends StatelessWidget {
  /////////////////////////////////////////////////////////////////
  final Dropdownbutton continentController = Get.put(Dropdownbutton());
  final ThemeController themeController = Get.put(ThemeController());
  final CountryController controller = Get.put(CountryController());
  /////////////////////////////////////////////////////////////////////
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              // alignment: Alignment.center,
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

              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Material(
                  elevation: 6,
                  child: Obx(
                    () => DropdownButtonFormField<String>(
                      value: continentController.defalt.value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          // borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
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
                                padding: const EdgeInsets.symmetric(
                                  vertical: 1,
                                ),
                                child: Text(continent),
                              ),
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return GridView.builder(
                    padding: EdgeInsets.all(40),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 0.85,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 13,
                    ),
                    itemCount: controller.countries.length,
                    itemBuilder: (context, index) {
                      final country = controller.countries[index];

                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                              child: Image.network(
                                country.flags.png,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      country.name.common,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      'Capital: ${country.capital}',
                                      style: TextStyle(color: Colors.grey[700]),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Capital: ${country.population}',
                                      style: TextStyle(color: Colors.grey[700]),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 8),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
