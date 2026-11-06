import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:google_fonts/google_fonts.dart'; // IMPORT GOOGLE FONTS
import '../../controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Language Switcher at Top Right
              Align(
                alignment: Alignment.topRight,
                child: Obx(() => GestureDetector(
                  onTap: () => authController.toggleLanguage(),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)]
                    ),
                    child: Text(authController.isKhmer.value ? "🇺🇸" : "🇰🇭", style: const TextStyle(fontSize: 22)),
                  ),
                )),
              ),
              const SizedBox(height: 20),

              // 1. Branding Header
              _buildBrandHeader(),
              const SizedBox(height: 50),

              // 2. Input Section
              _buildInputLabel('email_label'.tr), // Translated
              _buildTextField(
                controller: emailController,
                hint: 'email_hint'.tr, // Translated
                icon: LucideIcons.mail,
                type: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              _buildInputLabel('password_label'.tr), // Translated
              _buildTextField(
                controller: passController,
                hint: 'password_hint'.tr, // Translated
                icon: LucideIcons.lock,
                isObscure: true,
              ),

              // Forgot Password Link
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text('forgot_password'.tr, style: GoogleFonts.kantumruyPro(color: Colors.grey, fontWeight: FontWeight.bold)), // Translated
                ),
              ),
              const SizedBox(height: 30),

              // 3. Login Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE31E24), // DRSB Red
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 0,
                  ),
                  onPressed: () {
                    String email = emailController.text.trim();
                    String password = passController.text.trim();
                    if (email.isEmpty || password.isEmpty) {
                      Get.snackbar(
                          "Error",
                          "Please fill all fields",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white
                      );
                    } else {
                      authController.login(email, password);
                    }
                  },
                  child: Text('sign_in'.tr, style: GoogleFonts.kantumruyPro(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)), // Translated
                ),
              ),
              const SizedBox(height: 40),

              // 4. Register Option
              _buildRegisterSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandHeader() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "DRSB ",
                      style: GoogleFonts.kantumruyPro(color: const Color(0xFF00529B), fontSize: 36, fontWeight: FontWeight.w900)
                  ),
                  TextSpan(
                      text: "EXPRESS",
                      style: GoogleFonts.kantumruyPro(color: const Color(0xFFE31E24), fontSize: 36, fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text('world_class_logistics'.tr, style: GoogleFonts.kantumruyPro(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w600)), // Translated
      ],
    );
  }

  Widget _buildInputLabel(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 5, bottom: 8),
        child: Text(label, style: GoogleFonts.kantumruyPro(fontWeight: FontWeight.bold, color: Colors.black87)),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isObscure = false,
    TextInputType type = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FB),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
      ),
      child: TextField(
        controller: controller,
        obscureText: isObscure,
        keyboardType: type,
        style: GoogleFonts.kantumruyPro(fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: const Color(0xFF00529B), size: 20),
          hintText: hint,
          hintStyle: GoogleFonts.kantumruyPro(color: Colors.grey, fontSize: 14),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }

  Widget _buildRegisterSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('no_account'.tr, style: GoogleFonts.kantumruyPro(color: Colors.grey, fontWeight: FontWeight.w600)), // Translated
        GestureDetector(
          onTap: () => Get.toNamed('/register'),
          child: Text(
              'register_now'.tr, // Translated
              style: GoogleFonts.kantumruyPro(color: const Color(0xFF00529B), fontWeight: FontWeight.w900)
          ),
        ),
      ],
    );
  }
}