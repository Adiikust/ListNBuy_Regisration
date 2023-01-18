import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:listnbuy/Auth/registration_screen.dart';
import 'package:listnbuy/Screen_Size/screen_sizes.dart';
import 'package:listnbuy/Widget/build_size_box.dart';
import 'package:listnbuy/Widget/build_text_form_field.dart';
import 'package:listnbuy/Widget/text_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_5),
                buildTextFormField(
                  controller: _emailController,
                  hintText: "Title",
                  onChanged: (value) {},
                ),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_4),
                buildTextFormField(
                  controller: _passwordController,
                  hintText: "Title",
                  onChanged: (value) {},
                ),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_4),
                TextBottun(
                  text: "Login",
                  clickCallback: () {},
                ),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_4),
                TextBottun(
                  text: "Registration",
                  clickCallback: () {
                    Get.to(() => const RegistrationScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
