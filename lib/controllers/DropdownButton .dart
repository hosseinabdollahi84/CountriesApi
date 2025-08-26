import 'package:get/get.dart';

class Dropdownbutton extends GetxController {
  var defalt = "All".obs;
  final List<String> cont = [
    "All",
    "Africa",
    "Asia",
    "Europe",
    "America",
    "Oceania",
  ];
  void setContinent(String value) {
    defalt.value = value;
  }
}
