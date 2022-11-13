import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickles_rapyd/pages/inventory/inventory_controller.dart';
import 'package:pickles_rapyd/pages/testing_page/testing_page.dart';
import 'package:pickles_rapyd/routes/route_name.dart';

class Inventory extends GetView<InventoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(controller.title)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => controller.filterItem(value),
              decoration: const InputDecoration(
                  labelText: "Search", suffixIcon: Icon(Icons.search)),
            ),
            SizedBox(height: 20),
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
                  // shrinkWrap: true,
                  itemCount: controller.foundItems.length,
                  itemBuilder: (_, index) => CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: controller.selected
                        .contains(controller.foundItems[index]["name"]),
                    onChanged: ((value) => value ?? true
                        ? controller.checkboxAdd(
                            controller.foundItems[index]["name"].toString())
                        : controller.checkboxRemove(
                            controller.foundItems[index]["name"].toString())),
                    title: Text(
                      controller.foundItems[index]['name']
                          .toString()
                          .toUpperCase(),
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
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
            ElevatedButton(
                onPressed: () => Get.to(TestPage()), child: Text("TestPage"))
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
