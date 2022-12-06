import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickles_rapyd/app/routes/app_pages.dart';

import '../controllers/add_item_controller.dart';

// class AddItemView extends StatefulWidget {
//   @override
//   _AddItemViewState createState() => _AddItemViewState();
// }

class AddItemView extends GetView<AddItemController> {
  // final controller = Get.find<AddItemController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF6F6F6),
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
          'Projects',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Center(
              child: GetBuilder<AddItemController>(
                init: AddItemController(),
                builder: (c) {
                  return Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: c.imageFile == null
                            ? AssetImage("assets/upload_image_placeholder.jpg")
                            : Image.file(c.imageFile!).image,
                        radius: 60,
                      ),
                      Positioned(
                        right: -10,
                        bottom: 0,
                        child: ElevatedButton(
                          onPressed: () => c.getFromCamera(),
                          child: Icon(
                            Icons.edit,
                            size: 20,
                          ),
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              side: BorderSide(width: 5, color: Colors.white),
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(10),
                              backgroundColor: Color.fromRGBO(
                                  76, 168, 98, 1) // <-- Button color
                              // foregroundColor: Colors.red, // <-- Splash color
                              ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 55,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Product Name",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  SizedBox(
                    height: 26,
                    width: 178,
                    child: TextField(
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      controller: controller.productNameController,
                      // onChanged: (value) => controller.convertGBPtoPoint(value),
                      // keyboardType: TextInputType.number,
                      cursorColor: Color.fromRGBO(112, 185, 129, 1),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: Color.fromRGBO(217, 217, 217, 0.6),
                        label: Text.new(
                          "Enter a product name",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black26),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 11, vertical: 2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(112, 185, 129, 1),
                              width: 2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 1,
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 5),
              child: SmartSelect<String>.multiple(
                title: "Material",
                selectedValue: controller.selectedMaterial,
                onChange: (value) {
                  controller.selectMaterialChoice(value);
                },
                choiceItems: controller.matrialChoice,
                modalType: S2ModalType.bottomSheet,
                choiceDivider: true,
                tileBuilder: (context, state) {
                  return S2Tile.fromState(
                    state,
                    trailing: const Icon(Icons.keyboard_arrow_down),
                  );
                  // return ListTile(
                  //   title: Text(
                  //     "Material",
                  //     style:
                  //         TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  //   ),
                  //   dense: true,
                  //   visualDensity: VisualDensity(vertical: -2),
                  //   subtitle: Text(
                  //     state.selected.toString(),
                  //     style: const TextStyle(
                  //       color: Colors.grey,
                  //     ),
                  //     overflow: TextOverflow.ellipsis,
                  //     maxLines: 1,
                  //   ),
                  //   trailing: const Icon(
                  //     Icons.keyboard_arrow_down,
                  //     color: Colors.grey,
                  //   ),
                  //   onTap: state.showModal,
                  // );
                },
              ),
            ),
            Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 5),
              child: SmartSelect<String>.single(
                title: "Type",
                selectedValue: controller.selectedType,
                onChange: (value) {
                  controller.selectTypeChoice(value);
                },
                choiceItems: controller.typeChoice,
                modalType: S2ModalType.bottomSheet,
                choiceDivider: true,
                tileBuilder: (context, state) {
                  return S2Tile.fromState(
                    state,
                    trailing: const Icon(Icons.keyboard_arrow_down),
                  );
                  // return ListTile(
                  //   title: Text(
                  //     "Type",
                  //     style:
                  //         TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  //   ),
                  //   dense: true,
                  //   visualDensity: VisualDensity(vertical: -2),
                  //   subtitle: Text(
                  //     state.selected.toString(),
                  //     style: const TextStyle(
                  //       color: Colors.grey,
                  //     ),
                  //     overflow: TextOverflow.ellipsis,
                  //     maxLines: 1,
                  //   ),
                  //   trailing: const Icon(
                  //     Icons.keyboard_arrow_down,
                  //     color: Colors.grey,
                  //   ),
                  //   onTap: state.showModal,
                  // );
                },
              ),
            ),
            Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 5),
              child: SmartSelect<String>.single(
                title: "Approximate Size",
                selectedValue: controller.selectedSize,
                onChange: (value) {
                  controller.selectSizeChoice(value);
                },
                choiceItems: controller.sizeChoice,
                modalType: S2ModalType.bottomSheet,
                tileBuilder: (context, state) {
                  return S2Tile.fromState(
                    state,
                    trailing: const Icon(Icons.keyboard_arrow_down),
                  );
                  // return ListTile(
                  //   title: Text(
                  //     "Approximate Size",
                  //     style:
                  //         TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  //   ),
                  //   dense: true,
                  //   visualDensity: VisualDensity(vertical: -2),
                  //   subtitle: Text(
                  //     state.selected.toString(),
                  //     style: const TextStyle(
                  //       color: Colors.grey,
                  //     ),
                  //     overflow: TextOverflow.ellipsis,
                  //     maxLines: 1,
                  //   ),
                  //   trailing: const Icon(
                  //     Icons.keyboard_arrow_down,
                  //     color: Colors.grey,
                  //   ),
                  //   onTap: state.showModal,
                  // );
                },
              ),
            ),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Approximate Weight",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  SizedBox(
                    height: 26,
                    width: 178,
                    child: TextField(
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      controller: controller.productWeightController,
                      // onChanged: (value) => controller.convertGBPtoPoint(value),
                      // keyboardType: TextInputType.number,
                      cursorColor: Color.fromRGBO(112, 185, 129, 1),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: Color.fromRGBO(217, 217, 217, 0.6),
                        label: Text.new(
                          "Enter Aproximate Weight",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black26),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 11, vertical: 2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(112, 185, 129, 1),
                              width: 2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.addNewItem();
                        Get.toNamed(Routes.ADD_ITEM_SUCCESS);
                      },
                      // onPressed: () => Get.toNamed(Routes.ADD_ITEM_SUCCESS),
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
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
            )
          ],
        ),
      ),
    );
  }
}
