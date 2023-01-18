import 'package:flutter/material.dart';

class BuildSizeBox extends StatelessWidget {
  double? height;
  double? weight;
  BuildSizeBox({Key? key, this.height, this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: weight,
    );
  }
}
