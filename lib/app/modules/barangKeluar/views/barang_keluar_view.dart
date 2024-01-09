import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gudang/app/controllers/barang_controller.dart';
import 'package:gudang/app/routes/app_pages.dart';

import '../controllers/barang_keluar_controller.dart';

class BarangKeluarView extends GetView<BarangKeluarController> {
  @override
  final controller = Get.put(BarangKeluarController());
  final barangC = Get.put(BarangController());
  final data = Get.arguments;
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
     controller.textData(data);
    return Scaffold(
        body: Column(
      children: [
        Container(
          // padding: EdgeInsets.all(8),
          width: lebar,
          height: 80,
          decoration: BoxDecoration(color: Colors.blueGrey),
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 8),
                  child: InkWell(
                    onTap: () => Get.offAllNamed(Routes.HOME),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  )),
              Text(
                "Data Barang Keluar",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
