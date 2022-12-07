import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickles_rapyd/app/routes/app_pages.dart';

import '../controllers/receipt_scan_controller.dart';

class ReceiptScanView extends GetView<ReceiptScanController> {
  const ReceiptScanView({Key? key}) : super(key: key);
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
            'Receipt Scan Result',
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),
          ),
          centerTitle: true,
        ),
        // resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 34,
                // width: 240,
                child: TextField(
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  onChanged: (value) => controller.filterItem(value),
                  // controller: controller.nameController,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 11, vertical: 2),
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
                          "Search",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    enabledBorder: OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    labelStyle: TextStyle(color: Colors.grey.shade500),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(93, 176, 117, 1), width: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              GetBuilder<ReceiptScanController>(
                builder: (controller) {
                  return Visibility(
                    visible: !controller.searchStatus,
                    child: CheckboxListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        title: Transform.translate(
                          offset: Offset(-16, 0),
                          child: Text(
                            "Select all",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
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
                child: GetBuilder<ReceiptScanController>(
                  builder: (controller) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.foundItems.length,
                    itemBuilder: (_, index) => CheckboxListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0),

                      // dense: true,
                      // visualDensity: VisualDensity.comfortable,
                      controlAffinity: ListTileControlAffinity.leading,
                      secondary: Wrap(
                        spacing: 8,
                        children: [
                          Chip(
                            label: Text(
                                controller.foundItems[index].type!.capitalize!),
                          ),
                          Chip(
                            label: Text(
                                "${controller.foundItems[index].weight} kg"
                                    .toString()),
                          )
                        ],
                      ),
                      value: controller.selected
                          .contains(controller.foundItems[index]),
                      onChanged: ((value) => value ?? true
                          ? controller.checkboxAdd(controller.foundItems[index])
                          : controller
                              .checkboxRemove(controller.foundItems[index])),
                      title: Transform.translate(
                        offset: Offset(-16, 0),
                        child: Text(
                          controller.foundItems[index].name
                              .toString()
                              .capitalize!,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
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
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 53,
                      child: ElevatedButton(
                        onPressed: () async {
                          // controller.addToInventory();
                          // Get.toNamed(Routes.CROP);
                          await controller.addItemToInventory();
                          // Get.toNamed(Routes.MAP,
                          //     arguments: controller.recycleItems);
                        },
                        child: Text(
                          "Add Item(s) to Inventory",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
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
              )
            ],
          ),
        ));
  }
}
