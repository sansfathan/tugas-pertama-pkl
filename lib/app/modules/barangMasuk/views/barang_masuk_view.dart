// ignore_for_file: unused_local_variable, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:get/get.dart';
import 'package:gudang/app/controllers/barang_controller.dart';
import 'package:gudang/app/modules/home/controllers/home_controller.dart';
import 'package:gudang/app/routes/app_pages.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/barang_masuk_controller.dart';

class BarangMasukView extends GetView<BarangMasukController> {
  @override
  final controller = Get.put(BarangMasukController());
  final barangC = Get.put(BarangController());
  final data = Get.arguments;
  Widget build(BuildContext context) {
    final homeC = Get.put(HomeController());
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    controller.textData(data);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff282626),

          // Override the global settings
          title: Text(
            'Pasokan Barang',
            style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(color: Colors.white),
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
                  child: CustomInput2(controller: controller.namaProduk, label: 'nama produk', hint: 'Masukkan nama', obscure: false),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: CustomInput3(controller: controller.jumlahProduk, label: 'Jumlah Barang', hint: 'Masukkan Produk', obscure: false),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                      // enabled: false,
                      controller: controller.keteragan,
                      // obscureText: ,
                      maxLength: 20,
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.black,
                          fontSize: 19,
                        ),
                        hintText: "Keterangan Barang",
                        hintStyle: TextStyle(fontFamily: "Poppins", color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 18,
                        ),
                        // suffixIcon: ,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.black, width: 1),
                          gapPadding: 5,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: const BorderSide(color: Color.fromARGB(255, 27, 27, 27), width: 1),
                          gapPadding: 5,
                        ),
                      )),
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
                          decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(10)),
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
                          // margin: EdgeInsets.only(le: 10),
                          padding: EdgeInsets.all(7),
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                          child: InkWell(
                            onTap: () {
                              controller.simpanData(
                                  num.parse(controller.kodeProduk.text), int.parse(controller.jumlahProduk.text), controller.keteragan.text);
                            },
                            child: Text(
                              "Masokan barang",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
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
            child: Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
        ),
        Container(
          child: TextFormField(
              // enabled: false,
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
                hintStyle: TextStyle(fontFamily: "Poppins", color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
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
                  borderSide: const BorderSide(color: Color.fromARGB(255, 27, 27, 27), width: 1),
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
            child: Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
        ),
        Container(
          child: TextFormField(
              // enabled: false,
              controller: controller,
              obscureText: obscure,
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.black,
                  fontSize: 19,
                ),
                hintText: hint,
                hintStyle: TextStyle(fontFamily: "Poppins", color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
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
                  borderSide: const BorderSide(color: Color.fromARGB(255, 27, 27, 27), width: 1),
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
            child: Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
        ),
        Container(
          child: TextFormField(
              // enabled: false,
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
                hintStyle: TextStyle(fontFamily: "Poppins", color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
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
                  borderSide: const BorderSide(color: Color.fromARGB(255, 27, 27, 27), width: 1),
                  gapPadding: 5,
                ),
              )),
        ),
      ],
    );
  }
}
