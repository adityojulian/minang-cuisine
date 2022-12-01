import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/upload_image_placeholder.jpg"),
                    radius: 60,
                  ),
                  Positioned(
                    right: -10,
                    bottom: 0,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.edit,
                        size: 20,
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          side: BorderSide(width: 5, color: Colors.white),
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(10),
                          backgroundColor:
                              Color.fromRGBO(76, 168, 98, 1) // <-- Button color
                          // foregroundColor: Colors.red, // <-- Splash color
                          ),
                    ),
                  ),
                ],
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
                      controller: controller.productNameController,
                      // onChanged: (value) => controller.convertGBPtoPoint(value),
                      // keyboardType: TextInputType.number,
                      cursorColor: Color.fromRGBO(112, 185, 129, 1),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
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
            Divider(
              thickness: 1,
            ),
            // SizedBox(
            //   height: 20,
            // ),
            SmartSelect<String>.multiple(
              title: "Material",
              selectedValue: controller.selected,
              onChange: (value) {
                controller.selectMaterialChoice(value);
              },
              choiceItems: controller.matrialChoice,
              modalType: S2ModalType.popupDialog,
              tileBuilder: (context, state) {
                // return S2Tile.fromState(
                //   state,
                //   isTwoLine: true,
                // );
                return ListTile(
                  title: Text("Material"),
                  dense: true,
                  visualDensity: VisualDensity(vertical: -3),
                  subtitle: Text(
                    state.selected.toString(),
                    style: const TextStyle(color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  // state,
                  // isTwoLine: true,
                  // leading: Container(
                  //   width: 40,
                  //   alignment: Alignment.center,
                  //   child: const Icon(Icons.shopping_cart),
                  // ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                  ),
                  onTap: state.showModal,
                );
              },
            )
            // Divider(
            //   thickness: 1,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 27),
            //   child: Row(
            //     children: [
            //       Text(
            //         "Material",
            //         style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
