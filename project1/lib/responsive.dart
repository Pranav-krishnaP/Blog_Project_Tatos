import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:project1/Mobile/homepage.dart';
import 'package:project1/Mobile/loading.dart';
import 'package:project1/data/objects.dart';
import 'package:project1/webpage/errorscreen.dart';
import 'package:project1/webpage/homepage.dart';
import 'package:project1/webpage/loading.dart';

class Responsive extends StatelessWidget {
  const Responsive({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 800) {
        return const Mloading();
      } else {
        return const Loading();
      }
    });
  }
}
