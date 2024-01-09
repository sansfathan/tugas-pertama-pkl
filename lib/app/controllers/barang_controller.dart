import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gudang/app/routes/app_pages.dart';

class BarangController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String url = '';

  addData(int kodeProduk, String namaProduk, int stokProduk) async {
    CollectionReference dataBarang = firestore.collection('barang');

    final barang2 = {
      "kodeProduk": kodeProduk,
      "namaProduk": namaProduk,
      "stokProduk": stokProduk
    };
    try {
      await dataBarang.add(barang2).then((DocumentReference doc) =>
          Get.defaultDialog(
              title: "Alert", middleText: "Berhasil menambahkan data Barang"));
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      Get.defaultDialog(
          title: "Alert", middleText: "Gagal menambahkan data Barang");
      print(e);
    }
  }

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference dataraBarang = firestore.collection("barang");
    return await dataraBarang.get();
  }

  deleteData(String id) async {
    try {
      DocumentReference dataBarang = firestore.collection('barang').doc(id);

      Get.defaultDialog(
          title: "yakin Delete ?",
          middleText: "Apakah anda yakin ingin menghapus?",
          confirm: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              await dataBarang.delete();
              // await FirebaseAuth.instance.delete();
              Get.offAllNamed(Routes.HOME);
              print("berhasil Delete");
            },
            child: Text("yes"),
          ),
          cancel: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () => Get.back(),
            child: Text("No"),
          ));
      // return Get.offAllNamed(Routes.SLIDER_DATA);
    } catch (e) {
      Get.defaultDialog(title: 'Alert', middleText: 'gagal mendelete data');
      print(e);
    }
  }

  updateData(
    String id,
    String namaProduk,
    int stokProduk,
    int kodeProduk,
  ) async {
    final barang2 = {
      "namaProduk": namaProduk,
      "kodeProduk": kodeProduk,
      "stokProduk": stokProduk
    };
    try {
      DocumentReference mahaSiswa = firestore.collection('barang').doc(id);
      await mahaSiswa.update(barang2);

      Get.defaultDialog(
          title: 'Alert', middleText: '😊 berhasil menupdate data 😊');
      Get.offAllNamed(Routes.HOME);
      log("👉👉👉👉👉👉👉👉");
      print(barang2);
    } catch (error) {
      Get.defaultDialog(title: 'Alert', middleText: 'gagal menUpdate data');
      log("Anda Gagal dalam Update");
      print(barang2);
    }
  }
}
