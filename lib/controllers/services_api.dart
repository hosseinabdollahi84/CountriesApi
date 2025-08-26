import 'package:arz3/model/model.dart';
import 'package:arz3/services/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CountryController extends GetxController {
  var countries = <Welcome>[].obs;
  var isLoading = true.obs;
  final WelcomeService service = WelcomeService();

  @override
  void onInit() {
    fetchCountries();
    super.onInit();
  }

  void fetchCountries() async {
    try {
      isLoading(true);
      var data = await service.fetchCountries();
      countries.assignAll(data);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
