import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/register_controller.dart';
import 'apis_services.dart';
import 'network_client.dart';

Future<void> initData() async {
  Get.lazyPut(() => NetworkClient());

  Get.lazyPut(() => ApiService(networkClient: Get.find()));

  //Controllers
  // Get.lazyPut(() => RegisterController(apiService: Get.find()));

  Get.lazyPut<RegisterController>(
    () => RegisterController(apiService: Get.find()),
    fenix: true,
  );
}
