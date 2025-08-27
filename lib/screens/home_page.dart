import 'package:arz3/controllers/filtercontoroler.dart';
import 'package:arz3/controllers/ThemeController.dart';
import 'package:arz3/controllers/services_api.dart';
import 'package:arz3/screens/itempage.dart';
import 'package:arz3/widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  /////////////////////////////////////////////////////////////////
  final ThemeController themeController = Get.put(ThemeController());
  final CountryController controller = Get.put(CountryController());
  final Serchcontoroler serchcontoroler = Get.put(Serchcontoroler());

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
                    onChanged: (value) => serchcontoroler.setSearch(value),
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
                    () => DropdownButton<String>(
                      value: serchcontoroler.selectedContinent.value,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          serchcontoroler.setContinent(newValue);
                        }
                      },
                      items:
                          serchcontoroler.continents
                              .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value == "All" ? "همه قاره‌ها" : value,
                                  ),
                                );
                              })
                              .toList(),
                    ),
                  ),
                ),
              ),
            ),

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
                    itemCount: serchcontoroler.filteredCountries.length,
                    itemBuilder: (context, index) {
                      final country = serchcontoroler.filteredCountries[index];

                      return GestureDetector(
                        onTap: () {
                          final heroTag =
                              'flag${country.name.common}$index'; // تگ یکتا
                          Get.to(
                            () => Itempage(country: country, heroTag: heroTag),
                          );
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Hero(
                                tag: 'flag${country.name.common}$index',
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(12),
                                  ),
                                  child: Image.network(
                                    country.flags.png,
                                    width: double.infinity,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        country.name.common,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        'Population: ${NumberFormat('#,###').format(country.population)}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(country.region.toString()),
                                      const SizedBox(height: 8),

                                      Text(
                                        'Capital: ${country.capital.isNotEmpty ? country.capital : Text("__")} ',
                                      ),
                                      const SizedBox(height: 8),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
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
