import 'package:arz3/model/model.dart';
import 'package:arz3/services/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Serchcontoroler extends GetxController {
  var allCountries = <Welcome>[].obs;
  var filteredCountries = <Welcome>[].obs;
  var isLoading = true.obs;

  var selectedContinent = "All".obs;
  var searchText = "".obs;

  final List<String> continents = [
    "All",
    "Africa",
    "Asia",
    "Europe",
    "Americas",
    "Oceania",
  ];

  @override
  void onInit() {
    super.onInit();
    fetchCountries();

    everAll([selectedContinent, searchText], (_) => _filterCountries());
  }

  void fetchCountries() async {
    isLoading.value = true;
    try {
      final countries = await WelcomeService().fetchCountries();
      allCountries.value = countries;
      filteredCountries.value = countries;
    } finally {
      isLoading.value = false;
    }
  }

  void _filterCountries() {
    filteredCountries.value =
        allCountries.where((c) {
          final matchesContinent =
              selectedContinent.value == "All"
                  ? true
                  : c.region?.name?.toLowerCase().contains(
                        selectedContinent.value.toLowerCase(),
                      ) ??
                      false;

          final matchesSearch = c.name.common.toLowerCase().contains(
            searchText.value.toLowerCase(),
          );

          return matchesContinent && matchesSearch;
        }).toList();
  }

  void setContinent(String value) {
    selectedContinent.value = value;
  }

  void setSearch(String value) {
    searchText.value = value;
  }
}
