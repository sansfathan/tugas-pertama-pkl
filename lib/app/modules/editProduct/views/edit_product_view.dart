import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_product_controller.dart';

class EditProductView extends GetView<EditProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditProductView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EditProductView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
