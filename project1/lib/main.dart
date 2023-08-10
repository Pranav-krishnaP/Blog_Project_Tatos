import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:project1/Getxdependency.dart';
import 'package:project1/data/objects.dart';
import 'package:project1/responsive.dart';

void main() {
  GetxDependencyInjector().onInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Fetchdetails obj = Get.find();
    obj.fetchdata();
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/home',
      debugShowCheckedModeBanner: false,
      getPages: [GetPage(name: "/home", page: () => const Responsive())],
    );
  }
}
