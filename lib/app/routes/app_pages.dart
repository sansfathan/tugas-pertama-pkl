import 'package:get/get.dart';

import 'package:gudang/app/modules/addProduct/bindings/add_product_binding.dart';
import 'package:gudang/app/modules/addProduct/views/add_product_view.dart';
import 'package:gudang/app/modules/barangKeluar/bindings/barang_keluar_binding.dart';
import 'package:gudang/app/modules/barangKeluar/views/barang_keluar_view.dart';
import 'package:gudang/app/modules/barangMasuk/bindings/barang_masuk_binding.dart';
import 'package:gudang/app/modules/barangMasuk/views/barang_masuk_view.dart';
import 'package:gudang/app/modules/detail/bindings/detail_binding.dart';
import 'package:gudang/app/modules/detail/views/detail_view.dart';
import 'package:gudang/app/modules/editProduct/bindings/edit_product_binding.dart';
import 'package:gudang/app/modules/editProduct/views/edit_product_view.dart';
import 'package:gudang/app/modules/home/bindings/home_binding.dart';
import 'package:gudang/app/modules/home/views/home_view.dart';
import 'package:gudang/app/modules/laporanBarang/bindings/laporan_barang_binding.dart';
import 'package:gudang/app/modules/laporanBarang/views/laporan_barang_view.dart';
import 'package:gudang/app/modules/login/bindings/login_binding.dart';
import 'package:gudang/app/modules/login/views/login_view.dart';
import 'package:gudang/app/modules/product/bindings/product_binding.dart';
import 'package:gudang/app/modules/product/views/product_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PRODUCT,
      page: () => AddProductView(),
      binding: AddProductBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PRODUCT,
      page: () => EditProductView(),
      binding: EditProductBinding(),
    ),
    GetPage(
      name: _Paths.BARANG_MASUK,
      page: () => BarangMasukView(),
      binding: BarangMasukBinding(),
    ),
    GetPage(
      name: _Paths.BARANG_KELUAR,
      page: () => BarangKeluarView(),
      binding: BarangKeluarBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_BARANG,
      page: () => LaporanBarangView(),
      binding: LaporanBarangBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
   
  ];
}
