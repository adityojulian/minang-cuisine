import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickles_rapyd/app/routes/app_pages.dart';

import '../controllers/inventory_controller.dart';

class InventoryView extends GetView<InventoryController> {
  void openBottomSheet() {
    Get.bottomSheet(
      Container(
        height: 350,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  "Summary",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 20),
              Container(
                // width: 330,
                height: 61,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromRGBO(217, 217, 217, 1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text("TOTAL WEIGHT"), Text("15kg")],
                    ),
                    VerticalDivider(
                        indent: 10,
                        endIndent: 10,
                        color: Color.fromRGBO(0, 0, 0, 0.3)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text("REWARD"), Text("20p")],
                    ),
                    VerticalDivider(
                      indent: 10,
                      endIndent: 10,
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text("SAVED C02"), Text("No data")],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () => controller.getUserInventory(),
                  child: Text(
                    "Confirm",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(76, 168, 98, 0.8),
                    fixedSize: const Size(152, 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
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
        centerTitle: true,
        title: Text(
          controller.title,
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Filter",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 23, right: 18),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    onChanged: (value) => controller.filterItem(value),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(232, 232, 232, 1),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100)),
                        labelText: "Search",
                        labelStyle: TextStyle(color: Colors.grey.shade500)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            GetBuilder<InventoryController>(
              builder: (controller) {
                return Visibility(
                  visible: !controller.searchStatus,
                  child: CheckboxListTile(
                      title: Text(
                        "Select all",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: controller.selectAllStatus,
                      onChanged: (value) => value ?? true
                          ? controller.selectAll()
                          : controller.selectAll()),
                );
              },
            ),
            Expanded(
              child: GetBuilder<InventoryController>(
                builder: (controller) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.foundItems.length,
                  itemBuilder: (_, index) => CheckboxListTile(
                    // dense: true,
                    // visualDensity: VisualDensity.comfortable,
                    controlAffinity: ListTileControlAffinity.leading,
                    secondary: Wrap(
                      spacing: 8,
                      children: [
                        Chip(
                          label: Text(controller.foundItems[index].type!),
                        ),
                        Chip(
                          label: Text(
                              controller.foundItems[index].weight.toString()),
                        )
                      ],
                    ),
                    value: controller.selected
                        .contains(controller.foundItems[index]),
                    onChanged: ((value) => value ?? true
                        ? controller.checkboxAdd(controller.foundItems[index])
                        : controller
                            .checkboxRemove(controller.foundItems[index])),
                    title: Text(
                      controller.foundItems[index].name.toString(),
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    // trailing: Row(
                    //   children: [
                    //     Text(controller.foundItems[index]['type']),
                    //     Text(controller.foundItems[index]['weight']),
                    //   ],
                    // ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23, right: 18),
              child: SizedBox(
                height: 53,
                child: ElevatedButton(
                  onPressed: () {
                    // controller.addToInventory();
                    // Get.toNamed(Routes.CROP);
                    controller.fetchToModel();
                    Get.toNamed(Routes.MAP, arguments: controller.recycleItems);
                  },
                  child: Text(
                    "Reycle",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
            )
          ],
        ),
      ),
      // body: Container(
      //   child: Center(
      //       child: ElevatedButton(
      //     onPressed: () => Get.toNamed(RouteName.testpage),
      //     child: Text("Go to Test Page >> "),
      //   )),
      // ),
    );
  }
}
