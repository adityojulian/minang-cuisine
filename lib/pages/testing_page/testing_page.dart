import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickles_rapyd/pages/testing_page/haha.dart';
import 'package:pickles_rapyd/routes/route_name.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Center(
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 30, color: Colors.black),
          ),
        ),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.cancel,
              color: Colors.black,
            )),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Login",
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(16, 32, 16, 10),
          child: Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(232, 232, 232, 1),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      labelText: "Name"),
                ),
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(232, 232, 232, 1),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      labelText: "Email"),
                ),
                GetBuilder<TestPageController>(
                  init: TestPageController(),
                  builder: (controller) {
                    return TextField(
                      obscureText: controller.status,
                      decoration: InputDecoration(
                          suffixIcon: TextButton(
                              onPressed: () => controller.toggleShow(),
                              child: Text(
                                "Show",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green),
                              )),
                          filled: true,
                          fillColor: Color.fromRGBO(232, 232, 232, 1),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          labelText: "Password"),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}
