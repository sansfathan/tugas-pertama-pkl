import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gudang/app/controllers/barang_controller.dart';
import 'package:gudang/app/routes/app_pages.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  final barangC = Get.put(BarangController());
  final controller = Get.put(AddProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff282626),

          // Override the global settings
          title: Text(
            'Tambah Barang',
            style: Theme.of(context)
                .appBarTheme
                .titleTextStyle
                ?.copyWith(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(color: Color(0xffC3A9FF)),
          child: Container(
            // decoration: BoxDecoration(color: Color(0xff282626)),
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: CustomInput2(
                      controller: controller.namaProduk,
                      label: 'nama produk',
                      hint: 'Masukkan nama',
                      obscure: false),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: CustomInput(
                      controller: controller.kodeProduk,
                      label: 'kode produk ',
                      hint: 'Masukkan Kode',
                      obscure: false),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: CustomInput3(
                      controller: controller.stokProduk,
                      label: 'stok produk',
                      hint: 'Masukkan stok',
                      obscure: false),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(5),
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10)),
                          child: InkWell(
                            onTap: () => Get.offAllNamed(Routes.HOME),
                            child: Text(
                              "Back",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(5),
                          width: 110,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          child: InkWell(
                            onTap: () {
                              barangC.addData(
                                  int.parse(controller.kodeProduk.text),
                                  controller.namaProduk.text,
                                  int.parse(controller.stokProduk.text));
                            },
                            child: Text(
                              "Tambah barang",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget CustomInput({label, controller, obscure, hint, icon}) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(label,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
        ),
        Container(
          child: TextFormField(
              controller: controller,
              obscureText: obscure,
              maxLength: 20,
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.black,
                  fontSize: 19,
                ),
                hintText: hint,
                hintStyle: TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18,
                ),
                suffixIcon: icon,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.black, width: 1),
                  gapPadding: 5,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 27, 27, 27), width: 1),
                  gapPadding: 5,
                ),
              )),
        ),
      ],
    );
  }

  Widget CustomInput2({label, controller, obscure, hint, icon}) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(label,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
        ),
        Container(
          child: TextFormField(
              controller: controller,
              obscureText: obscure,
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.black,
                  fontSize: 19,
                ),
                hintText: hint,
                hintStyle: TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18,
                ),
                suffixIcon: icon,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.black, width: 1),
                  gapPadding: 5,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 27, 27, 27), width: 1),
                  gapPadding: 5,
                ),
              )),
        ),
      ],
    );
  }

  Widget CustomInput3({label, controller, obscure, hint, icon}) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(label,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
        ),
        Container(
          child: TextFormField(
              controller: controller,
              obscureText: obscure,
              maxLength: 3,
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.black,
                  fontSize: 19,
                ),
                hintText: hint,
                hintStyle: TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18,
                ),
                suffixIcon: icon,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.black, width: 1),
                  gapPadding: 5,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 27, 27, 27), width: 1),
                  gapPadding: 5,
                ),
              )),
        ),
      ],
    );
  }
}
