import 'package:arz3/services/services.dart';
import 'package:get/get.dart';
import 'package:arz3/model/model.dart';

class Serchcontoroler extends GetxController {
  var allCountries = <Welcome>[].obs;
  var filteredCountries = <Welcome>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCountries();
  }

  void fetchCountries() async {
    try {
      isLoading.value = true;
      final countries = await WelcomeService().fetchCountries();
      allCountries.value = countries;
      filteredCountries.value = countries; // ابتدا همه را نمایش بده
    } finally {
      isLoading.value = false;
    }
  }

  void filterCountries(String query) {
    if (query.isEmpty) {
      filteredCountries.value = allCountries;
    } else {
      filteredCountries.value =
          allCountries
              .where(
                (c) =>
                    c.name.common.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    }
  }
}
