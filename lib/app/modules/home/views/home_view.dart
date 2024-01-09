import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:get/get.dart';
import 'package:gudang/app/controllers/auth_controller_controller.dart';
import 'package:gudang/app/controllers/barang_controller.dart';
import 'package:gudang/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final logOut = Get.put(AuthControllerController());
  final barangC = Get.put(BarangController());
  final homeC = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff08FFC8),

          // Override the global settings
          title: Text(
            'Gudang',
            style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            // IconButton(
            //     icon: const Icon(Icons.logout),
            //     onPressed: () => logOut.logOut())
          ],
        ),
        drawer: Drawer(
          backgroundColor: Color(0xffC3A9FF),
          child: Container(
            child: ListView(
              children: [
                DrawerHeader(
                    child: Center(
                  child: Text(
                    "GD . JAYA",
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                )),
                Container(
                  width: Get.width,
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(
                                Icons.storage,
                                color: Colors.white,
                                size: 30,
                              ),
                              title: Text(
                                "Product",
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                              onTap: () => Get.toNamed(Routes.PRODUCT),
                            ),
                            ListTile(
                              leading: Icon(Icons.document_scanner, size: 30, color: Colors.white),
                              title: Text(
                                "Entry Items",
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                              onTap: () async {
                                String barCode = await FlutterBarcodeScanner.scanBarcode("#000000", "Batalkan", true, ScanMode.BARCODE);

                                homeC.GetProdukById(int.parse(barCode));
                              },
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.document_scanner_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                              title: Text(
                                "Exit Items",
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                              onTap: () async {
                                String barCode = await FlutterBarcodeScanner.scanBarcode("#000000", "Batalkan", true, ScanMode.BARCODE);

                                homeC.GetProdukById2(int.parse(barCode));
                              },
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.report,
                                color: Colors.white,
                                size: 30,
                              ),
                              title: Text(
                                "Report",
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                              onTap: () => Get.toNamed(Routes.LAPORAN_BARANG),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () => logOut.logOut(),
                        child: Container(
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Text(
                                  "Log Out",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xff282626)),
                                ),
                              ),
                              Icon(
                                Icons.login_rounded,
                                color: Color(0xff282626),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: lebar,
            // height: tinggi * 1.09,
            decoration: BoxDecoration(color: Color(0xff282626)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // decoration: BoxDecoration(color: Colors.amber),
                  // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        FutureBuilder<QuerySnapshot<Object?>>(
                          future: barangC.getData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.done) {
                              print(barangC.getData());
                              var listData = snapshot.data!.docs;
                              return Column(
                                children: List.generate(listData.length, (index) {
                                  return Container(
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      margin: EdgeInsets.only(top: 10),
                                      width: lebar,
                                      height: 110,
                                      decoration: BoxDecoration(
                                          color: Color(0xff000000),

                                          // border: Border.all(color: Colors.black),
                                          borderRadius: BorderRadius.circular(10)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    (listData[index].data() as Map<String, dynamic>)["namaProduk"],
                                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        // width: 45,
                                                        child: Text(
                                                          "Stok :",
                                                          style: TextStyle(color: Colors.white),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(top: 5, left: 10),
                                                        // width: 45,
                                                        child: Text((listData[index].data() as Map<String, dynamic>)["stokProduk"].toString(),
                                                            style: TextStyle(color: Colors.white)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        // width: 70,
                                                        child: Text("Code :", style: TextStyle(color: Colors.white)),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(top: 3, left: 10),
                                                        // width: 40,
                                                        child: Text((listData[index].data() as Map<String, dynamic>)["kodeProduk"].toString(),
                                                            style: TextStyle(color: Colors.white)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            // width: lebar,
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(bottom: 0),
                                                  child: ElevatedButton(
                                                    onPressed: () => Get.offAllNamed(Routes.DETAIL, arguments: listData[index]),
                                                    child: Icon(
                                                      Icons.edit,
                                                      size: 20,
                                                      color: Color(0xff282626),
                                                    ),
                                                    style: ElevatedButton.styleFrom(primary: Color(0xffC0FF99)),
                                                  ),
                                                ),
                                                Container(
                                                  child: ElevatedButton(
                                                    onPressed: () => barangC.deleteData(listData[index].id),
                                                    child: Icon(
                                                      Icons.delete,
                                                      size: 20,
                                                      color: Colors.white,
                                                    ),
                                                    style: ElevatedButton.styleFrom(primary: Colors.red),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              );
                            } else {
                              return Container(margin: EdgeInsets.only(top: 50), child: Center(child: CircularProgressIndicator()));
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Get.offAllNamed(Routes.ADD_PRODUCT),
          label: Icon(Icons.add),
        ));
  }
}

// class MyWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: const Text("Home1"),
//           backgroundColor: Colors.blue,
//         ),
//         drawer: const NavigationDrawer(),
//       );
// }

// class NavigationDrawer extends StatelessWidget {
//   const NavigationDrawer ({super.key});

//   @override
//   Widget build(BuildContext context) => Draw
// }
