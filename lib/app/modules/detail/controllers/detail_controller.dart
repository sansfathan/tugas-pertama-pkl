import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gudang/app/modules/home/controllers/home_controller.dart';
// import '';

class DetailController extends GetxController {
  final data = Get.arguments;

  TextEditingController namaProduk = TextEditingController();
  TextEditingController stokProduk = TextEditingController();
  TextEditingController kodeProduk = TextEditingController();
  final count = 0.obs;
  @override
  void onInit() {
    print(data);
    namaProduk.text = (data.data() as Map<String, dynamic>)['namaProduk'];
    stokProduk.text =
        (data.data() as Map<String, dynamic>)['stokProduk'].toString();
    kodeProduk.text =
        (data.data() as Map<String, dynamic>)['kodeProduk'].toString();
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
