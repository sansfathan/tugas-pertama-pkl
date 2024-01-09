import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gudang/app/controllers/barang_controller.dart';
import 'package:gudang/app/routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var data;

  final count = 0.obs;
  @override
  void onInit() {
    data = BarangController().getData();
    print(data);
    super.onInit();
  }

  GetProdukById(int id) async {
    try {
      var hasil = await FirebaseFirestore.instance
          .collection("barang")
          .where("kodeProduk", isEqualTo: id)
          .get();

          if (hasil.docs.isNotEmpty) {
            Get.toNamed(Routes.BARANG_MASUK, arguments: hasil.docs);
          } else {
            Get.snackbar("Fail", "data tidak ditemukan");
          }
    } catch (error) {
      Get.snackbar("Error", "⚠️ terjadi Error ⚠️");
      print(error);
    }
  }
  GetProdukById2(int id) async {
    try {
      var hasil = await FirebaseFirestore.instance
          .collection("barang")
          .where("kodeProduk", isEqualTo: id)
          .get();

          if (hasil.docs.isNotEmpty) {
            Get.toNamed(Routes.BARANG_KELUAR, arguments: hasil.docs);
          } else {
            Get.snackbar("Fail", "data tidak ditemukan");
          }
    } catch (error) {
      Get.snackbar("Error", "⚠️ terjadi Error ⚠️");
      print(error);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
