import 'package:get/get.dart';
import 'package:project1/data/objects.dart';

class GetxDependencyInjector {
  void onInit() {
    Get.put(Fetchdetails());
  }
}
