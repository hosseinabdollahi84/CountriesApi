import 'package:arz3/widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';

class Itempage extends StatelessWidget {
  final dynamic country;
  final String heroTag;
  const Itempage({super.key, required this.country, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),

      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: Container(
                      width: 100,
                      height: 38,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(
                              255,
                              196,
                              189,
                              189,
                            ).withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(4, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.arrow_back), Text("back")],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),

                children: [
                  Hero(
                    tag: heroTag,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        country.flags.png,
                        height: 220,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          country.name.common,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                        SizedBox(height: 15),

                        Text(
                          'Native Name: ${country.name.nativeName.values.map((n) => n.common).join(', ')}\n'
                          'Population: ${NumberFormat('#,###').format(country.population)}\n'
                          '${country.region}\n'
                          'subregion: ${country.subregion}\n'
                          'capital: ${country.capital[0]}\n\n'
                          'Top Level Domain: ${country.tld[0]}\n'
                          'Currencies: ${country.currencies.values.map((c) => '${c.name} (${c.symbol})').join(', ')}\n'
                          'Languages: ${country.languages.values.join(', ')}\n',

                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            height: 2.2,
                          ),
                        ),
                        Text(
                          'Border Countries:',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                country.borders.map<Widget>((borderCode) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 6.0),
                                    child: Card(
                                      elevation: 4,
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 4,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          borderCode,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
