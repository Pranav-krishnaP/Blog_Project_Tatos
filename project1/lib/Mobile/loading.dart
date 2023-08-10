import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project1/Mobile/homepage.dart';

import '../data/objects.dart';
import 'error.dart';

class Mloading extends StatelessWidget {
  const Mloading({super.key});

  @override
  Widget build(BuildContext context) {
    Fetchdetails obj = Get.find();
    obj.fetchdata();
    return Obx(() => obj.isLoading.value == 1
        ? const Scaffold(body: Center(child: const CircularProgressIndicator()))
        : (obj.isLoading.value == 0
            ? const Mhomescreen()
            : const MerrorScreen()));
  }
}
