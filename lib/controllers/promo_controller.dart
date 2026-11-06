import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromoController extends GetxController {
  // Reactive list of images
  var promoImages = <String>[
    "https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=2000&auto=format&fit=crop",
    "https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=2000&auto=format&fit=crop"
  ].obs;

  void addPromo(String url) {
    if (url.isNotEmpty) {
      promoImages.add(url);
      Get.snackbar("Success", "Promotion added!", backgroundColor: Colors.green, colorText: Colors.white);
    }
  }

  void updatePromo(int index, String newUrl) {
    if (newUrl.isNotEmpty) {
      promoImages[index] = newUrl;
      Get.snackbar("Success", "Promotion updated!", backgroundColor: Colors.blue, colorText: Colors.white);
    }
  }

  void deletePromo(int index) {
    promoImages.removeAt(index);
    Get.snackbar("Deleted", "Promotion removed.", backgroundColor: Colors.red, colorText: Colors.white);
  }
}