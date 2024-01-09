import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gudang/app/controllers/auth_controller_controller.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    final controller = Get.put(LoginController());
    final authC = Get.put(AuthControllerController());
    return Obx(
      () => Scaffold(
          body: Container(
        decoration: BoxDecoration(),
        child: SafeArea(
            child: Container(
          decoration: BoxDecoration(color: Color(0xffC3A9FF)),
          // padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    color: Color(0xff282626)),
                width: lebar,
                height: tinggi * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 100),
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Login ",
                          // textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        controller: controller.email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(5)),
                          label: Text(
                            "Email",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: TextField(
                          controller: controller.password,
                          keyboardType: TextInputType.text,
                          // decoration: InputDecoration(
                          //     label: Text("password"), hintText: "password"),
                          obscureText:
                              controller.showhidepw.value ? false : true,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () => controller.changeEyes(),
                                icon: Icon(
                                  controller.showhidepw.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                              ),
                              label: Text(
                                "Enter Your Password",
                                style: TextStyle(color: Colors.black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5)))),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 10),
                width: 180,
                height: 40,
                child: ElevatedButton(
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff282626),
                    // side: BorderSide(color: Colors.yellow, width: 5),
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),

                    // shadowColor: Colors.lightBlue,
                  ),
                  onPressed: () => authC.login(
                      controller.email.text, controller.password.text),
                ),
              )
            ],
          ),
        )),
      )),
    );
  }
}
// ElevatedButton(
//                     onPressed: () => authC.login(
//                         controller.email.text, controller.password.text),
//                     child: Text("Submit")),
