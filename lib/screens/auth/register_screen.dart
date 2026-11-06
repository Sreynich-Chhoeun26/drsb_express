import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.chevronLeft, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Create Account",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF00529B)
                ),
              ),
              const Text(
                "Join DRSB Express logistics team",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 40),

              _buildInputLabel("Full Name"),
              _buildTextField(hint: "Enter your full name", icon: LucideIcons.user),
              const SizedBox(height: 20),

              _buildInputLabel("Phone Number"),
              _buildTextField(hint: "Enter phone number", icon: LucideIcons.phone, type: TextInputType.phone),
              const SizedBox(height: 20),

              _buildInputLabel("Email"),
              _buildTextField(hint: "Enter email address", icon: LucideIcons.mail, type: TextInputType.emailAddress),
              const SizedBox(height: 20),

              _buildInputLabel("Password"),
              _buildTextField(hint: "Create a password", icon: LucideIcons.lock, isObscure: true),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE31E24),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Get.snackbar("Success", "Account created successfully!");
                    Get.offAllNamed('/login');
                  },
                  child: const Text(
                      "REGISTER",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, bottom: 8),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    bool isObscure = false,
    TextInputType type = TextInputType.text
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FB),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        obscureText: isObscure,
        keyboardType: type,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: const Color(0xFF00529B), size: 20),
          hintText: hint,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }
}