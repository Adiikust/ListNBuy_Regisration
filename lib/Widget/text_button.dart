import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextBottun extends StatelessWidget {
  final String text;
  final VoidCallback clickCallback;
  const TextBottun({Key? key, required this.text, required this.clickCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => clickCallback(),
      child: Container(
          height: Get.height * 0.07,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          )),
    );
  }
}
