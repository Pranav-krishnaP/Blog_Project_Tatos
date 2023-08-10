import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project1/data/objects.dart';

import 'errorscreen.dart';
import 'homepage.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    Fetchdetails obj = Get.find();
    obj.fetchdata();
    return Obx(() => obj.isLoading.value == 1
        ? const CircularProgressIndicator()
        : (obj.isLoading.value == 0
            ? const Homescreen()
            : const ErrorScreen()));
  }
}
