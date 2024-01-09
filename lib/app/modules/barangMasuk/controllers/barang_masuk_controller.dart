import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gudang/app/routes/app_pages.dart';

class BarangMasukController extends GetxController {
  // final data = Get.arguments;
  String id = "";
  RxInt jumlah = 0.obs;
  TextEditingController namaProduk = TextEditingController();
  TextEditingController jumlahProduk = TextEditingController();
  TextEditingController kodeProduk = TextEditingController();
  TextEditingController keteragan = TextEditingController();

  textData(data) {
    data.forEach((element) {
      id = element.id;
      jumlah.value = int.parse((element.data() as Map<String, dynamic>)['stokProduk'].toString());
      namaProduk.text = (element.data() as Map<String, dynamic>)['namaProduk'];

      kodeProduk.text = (element.data() as Map<String, dynamic>)['kodeProduk'].toString();
    });
  }
  
  simpanData(num kodeProduk, int stokProduk, String keteranagn) async {
    DateTime sekarang = DateTime.now();

    CollectionReference barangMasuk = FirebaseFirestore.instance.collection('barangMasuk');

    final dataBarang = {
      "keterangan": keteragan,
      "idBarangMasuk": "BRGMSK080823001",
      "kodeProduct": kodeProduk,
      "jumlahProduk": stokProduk,
      "emailPetugas": FirebaseAuth.instance.currentUser?.email,
      "dateTime ": sekarang
    };
    // try {
    await barangMasuk.add(dataBarang).then((DocumentReference doc) {
      print('Document Snapshot added with Id : ${doc.id}');
    });
    final ubahData = {"jumlahProduk": jumlah.value + stokProduk};
    DocumentReference Barang = FirebaseFirestore.instance.collection('barang').doc(id);
    await Barang.update(ubahData);
    Get.offAllNamed(Routes.HOME);
    // } catch (e) {
    //   Get.defaultDialog(title: "Alert", middleText: "Gagal menambahkan data Barang");
    //   print(e);
    // }
  }

  final count = 0.obs;
  @override
  void onInit() {
    // print(data);

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
