import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class BarangMasukController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String url = '';

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference dataraBarangMasuk = firestore.collection("barangMasuk");
    return await dataraBarangMasuk.get();
  }
}
