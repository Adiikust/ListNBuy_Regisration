import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
// import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:listnbuy/Auth/login_screen.dart';
import 'package:listnbuy/Controller/register_controller.dart';
import 'package:listnbuy/Screen_Size/screen_sizes.dart';
import 'package:listnbuy/Widget/build_size_box.dart';
import 'package:listnbuy/Widget/build_text_form_field.dart';
import 'package:listnbuy/Widget/text_button.dart';
// import 'dart:io';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  XFile? _image;
  bool adii = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _countryCodeController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _termController = TextEditingController();
  final TextEditingController _conformPasswordController =
      TextEditingController();

  ///
  registerUser() async {
    String response = await Get.find<RegisterController>().registerUser(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        conformPassword: _conformPasswordController.text,
        phone: _phoneController.text,
        code: _countryCodeController.text,
        term: adii,
        image: _image!);
    if (response == 'success') {
      Get.snackbar('Message', 'You Have Successfully Register');
      Get.to(LoginScreen());
    }
  }

  ///Image Picker
  Future<void> pickImage(ImageSource source) async {
    XFile? imagePicked = await ImagePicker().pickImage(source: source);

    if (imagePicked != null) {
      _image = imagePicked;
      setState(() {});
      Get.back();
      //todo check to add await
    } else {
      return;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(RegisterController(apiService: Get.find()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_5),
                  buildTextFormField(
                    controller: _nameController,
                    hintText: "Name",
                    onChanged: (value) {},
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_4),
                  buildTextFormField(
                    controller: _emailController,
                    hintText: "Email",
                    onChanged: (value) {},
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_4),
                  buildTextFormField(
                    controller: _passwordController,
                    hintText: "Password",
                    onChanged: (value) {},
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_4),
                  buildTextFormField(
                    controller: _conformPasswordController,
                    hintText: "Conform Password",
                    onChanged: (value) {},
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_4),
                  buildTextFormField(
                    controller: _countryCodeController,
                    hintText: "Country Code",
                    onChanged: (value) {},
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_4),
                  buildTextFormField(
                    controller: _phoneController,
                    hintText: "Phone Number",
                    onChanged: (value) {},
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_4),
                  InkWell(
                    onTap: () {
                      showWarning(context);
                    },
                    child: Container(
                      width: double.infinity,
                      height: Get.height * ScreenSizes.SCREEN_SIZE_20,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: _image != null
                          ? Image.file(
                              File(_image!.path),
                              fit: BoxFit.fill,
                            )
                          : const Icon(
                              Icons.camera_alt_outlined,
                              size: 40,
                              color: Colors.white,
                            ),
                    ),
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_4),
                  TextBottun(
                    text: "Registration",
                    clickCallback: () {
                      registerUser();
                    },
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_4),
                  TextBottun(
                    text: "Back Login",
                    clickCallback: () {
                      Get.to(() => const LoginScreen());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Pop
  showWarning(BuildContext context) async => await showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    "Pick Images...",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                pickImage(ImageSource.camera);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                              ),
                              child: const Text(
                                "Camera",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                pickImage(ImageSource.gallery);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                              ),
                              child: const Text(
                                "Gallery",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ));
}
