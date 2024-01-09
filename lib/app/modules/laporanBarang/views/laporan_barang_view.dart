import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gudang/app/routes/app_pages.dart';

import '../controllers/laporan_barang_controller.dart';

class LaporanBarangView extends GetView<LaporanBarangController> {
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
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
                "Data Laporan Barang",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
