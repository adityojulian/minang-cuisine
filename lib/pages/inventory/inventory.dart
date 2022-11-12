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
            Expanded(
              child: GetBuilder<InventoryController>(
                builder: (controller) => ListView.builder(
                  // shrinkWrap: true,
                  itemCount: controller.foundItems.length,
                  itemBuilder: (_, index) => CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: controller.selected.contains(index),
                    onChanged: ((value) => value ?? true
                        ? controller.checkboxAdd(index)
                        : controller.checkboxRemove(index)),
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
