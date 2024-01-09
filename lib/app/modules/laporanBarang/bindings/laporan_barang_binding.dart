import 'package:get/get.dart';

import '../controllers/laporan_barang_controller.dart';

class LaporanBarangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanBarangController>(
      () => LaporanBarangController(),
    );
  }
}
