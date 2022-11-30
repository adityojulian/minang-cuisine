import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MaterialChipView extends GetView {
  MaterialChipView({super.key, required this.material});
  final String material;
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        material,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
      labelPadding: EdgeInsets.all(2.0),
      backgroundColor: Color.fromRGBO(217, 217, 217, 0.3),
      elevation: 3,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(8.0),
    );
  }
}
