import 'dart:convert';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:image_picker/image_picker.dart';
import 'package:listnbuy/services/apis_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  final ApiService apiService;

  RegisterController({required this.apiService});

  Future<String> registerUser(
      {required final name,
      required final email,
      required final password,
      required final conformPassword,
      required final phone,
      required final code,
      required final term,
      required XFile image}) async {
    String message = 'success';
    var formData = FormData.fromMap({
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': conformPassword,
      'phone': phone,
      'country_code': code,
      'accept_terms': true,
      'photo': await MultipartFile.fromFile(
        image.path,
        filename: image.path.split("/").last,
      ),
    });
    final response = await apiService.registerUser(formData);

    if (response.statusCode == 200) {
      print("#######################################");
      Map<String, dynamic> map = jsonDecode(response.toString());
      print("#################" + map.toString());
      SharedPreferences sharedP = await SharedPreferences.getInstance();
      // sharedP.setString('userToken', map['access_token']);
      print(sharedP.getString('userToken'));
      return message;
    } else {
      return message = 'Not Working';
    }
  }
}
