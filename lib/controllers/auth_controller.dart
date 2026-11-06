import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // Observables for role-based access
  var currentUserRole = ''.obs;

  // Observable for language state
  var isKhmer = false.obs;

  /// Function to toggle between English and Khmer
  void toggleLanguage() {
    isKhmer.value = !isKhmer.value;
    if (isKhmer.value) {
      Get.updateLocale(const Locale('km', 'KH'));
      Get.snackbar(
        "ភាសា",
        "បានប្តូរទៅជាភាសាខ្មែរ",
        snackPosition: SnackPosition.BOTTOM, // Fixes the overlapping issue
        backgroundColor: Colors.black87,
        colorText: Colors.white,
        margin: const EdgeInsets.all(15),
      );
    } else {
      Get.updateLocale(const Locale('en', 'US'));
      Get.snackbar(
        "Language",
        "Switched to English",
        snackPosition: SnackPosition.BOTTOM, // Fixes the overlapping issue
        backgroundColor: Colors.black87,
        colorText: Colors.white,
        margin: const EdgeInsets.all(15),
      );
    }
  }

  /// Function to handle login with email and password validation
  void login(String email, String password) {
    if (email == "admin@express.com" && password == "123456") {
      currentUserRole.value = 'admin';
      Get.offAllNamed('/dashboard');
    } else {
      Get.snackbar(
        "Login Failed",
        "Invalid email or password",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withValues(alpha: 0.8),
        colorText: Colors.white,
        margin: const EdgeInsets.all(15),
        duration: const Duration(seconds: 3),
      );
    }
  }

  /// Reset state and return to login screen
  void logout() {
    currentUserRole.value = '';
    Get.offAllNamed('/login');
  }
}