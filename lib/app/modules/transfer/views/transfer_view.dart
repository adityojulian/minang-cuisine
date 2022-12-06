import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickles_rapyd/app/routes/app_pages.dart';

import '../controllers/transfer_controller.dart';

class TransferView extends GetView<TransferController> {
  const TransferView({Key? key}) : super(key: key);
  void openBottomSheet() {
    Get.bottomSheet(
      Container(
        height: 250,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 9.0),
                child: Container(
                  width: 32,
                  height: 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black26),
                ),
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Amount",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 20),
                  Stack(
                    children: [
                      SizedBox(
                        height: 58,
                        // width: 293,
                        child: TextField(
                          controller: controller.amount,
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          // onChanged: (value) => controller.convertGBPtoPoint(value),
                          keyboardType: TextInputType.number,
                          cursorColor: Color.fromRGBO(112, 185, 129, 1),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            filled: true,
                            fillColor: Colors.white,
                            label: Text.new(
                              "Amount to transfer",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.black26),
                            ),
                            contentPadding: EdgeInsets.only(left: 60),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 0, 0, 0.2),
                                  width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 0, 0, 0.2),
                                  width: 2),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 48,
                        width: 49,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Color.fromRGBO(0, 0, 0, 0.2)),
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: Center(
                          child: Icon(
                            Icons.currency_pound_rounded,
                            size: 17,
                            // weight: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 36,
                        child: ElevatedButton(
                          onPressed: () => Get.toNamed(Routes.TRANSFER_SUCCESS),
                          child: Text(
                            "Confirm",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(76, 168, 98, 0.8),
                            fixedSize: const Size(152, 32),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        leading: TextButton(
          onPressed: () => Get.back(),
          child: Text(
            "Back",
            style: TextStyle(
                color: Color(0xFF5DB075),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
        title: const Text(
          'Transfer',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Card(
            elevation: 0,
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: SizedBox(
              height: 130,
              width: Get.size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/gradient_box.png"),
                    fit: BoxFit.cover,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Available Balance",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                      GetBuilder<TransferController>(
                        builder: (c) {
                          if (c.profile.balance != null) {
                            return Text(
                              "£" + c.profile.balance.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.white),
                            );
                          } else {
                            return CircularProgressIndicator(
                              color: Color.fromRGBO(93, 176, 117, 1),
                            );
                          }
                        },
                      ),
                      Text(
                        "Pickles : 1000",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 34,
                        // width: 240,
                        child: TextFormField(
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          onChanged: (value) => controller.filterItem(value),
                          // controller: controller.nameController,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 11, vertical: 2),
                            label: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "e.g John Doe",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            enabledBorder: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            labelStyle: TextStyle(color: Colors.grey.shade500),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(93, 176, 117, 1),
                                  width: 2),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    SizedBox(
                      height: 34,
                      child: ElevatedButton(
                        onPressed: () => Get.toNamed(Routes.SETUP_PAYMENT),
                        child: Text(
                          "+ New",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 1,
                          backgroundColor: Color.fromRGBO(76, 168, 98, 0.8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 17,
                ),
                Container(
                  height: 200,
                  child: Expanded(
                    child: GetBuilder<TransferController>(
                      builder: (c) {
                        return ListView.builder(
                          itemCount: c.foundItems.length,
                          itemBuilder: (_, index) => ListTile(
                            onTap: () => openBottomSheet(),
                            contentPadding: EdgeInsets.symmetric(horizontal: 0),
                            horizontalTitleGap: 15,
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey[300],
                            ),
                            title: Text(
                              controller.foundItems[index],
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
