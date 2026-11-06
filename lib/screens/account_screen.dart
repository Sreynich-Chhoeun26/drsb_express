import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../controllers/auth_controller.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
            'profile_title'.tr, // Translated
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(LucideIcons.chevronLeft, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 20),
            _buildAccountStats(),
            const SizedBox(height: 30),
            _buildSettingsList(authController),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage("https://ui-avatars.com/api/?name=NICH&background=00529B&color=fff"),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(color: Color(0xFFE31E24), shape: BoxShape.circle),
                  child: const Icon(LucideIcons.camera, color: Colors.white, size: 16),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          const Text(
              "NICH DEVELOPER",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Color(0xFF00529B))
          ),
          const Text(
              "nich@express.com",
              style: TextStyle(color: Colors.grey, fontSize: 14)
          ),
        ],
      ),
    );
  }

  Widget _buildAccountStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _statItem('orders_stat'.tr, "124"), // Translated
          _statItem('vouchers_stat'.tr, "5"), // Translated
          _statItem('points_stat'.tr, "1.2k"), // Translated
        ],
      ),
    );
  }

  Widget _statItem(String label, String value) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10)],
        ),
        child: Column(
          children: [
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsList(AuthController auth) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('account_settings'.tr, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12)), // Translated
          const SizedBox(height: 15),

          _settingTile(LucideIcons.user, 'edit_profile'.tr, Colors.blue, '/profile'), // Translated
          _settingTile(LucideIcons.shieldCheck, 'security'.tr, Colors.green, '/security'), // Translated
          _settingTile(LucideIcons.bell, 'notifications'.tr, Colors.orange, '/notifications'), // Translated
          _settingTile(LucideIcons.globe, 'language'.tr, Colors.purple, '/language'), // Translated

          const SizedBox(height: 20),
          Text('support'.tr, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12)), // Translated
          const SizedBox(height: 15),

          _settingTile(LucideIcons.helpCircle, 'help_center'.tr, Colors.blueGrey, '/support'), // Translated

          const SizedBox(height: 10),
          // Logout Button
          InkWell(
            onTap: () => auth.logout(),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const Icon(LucideIcons.logOut, color: Colors.red),
                  const SizedBox(width: 15),
                  Text('logout'.tr, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)), // Translated
                  const Spacer(),
                  const Icon(LucideIcons.chevronRight, color: Colors.red, size: 18),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _settingTile(IconData icon, String title, Color color, String route) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, color: color, size: 20),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
        trailing: const Icon(LucideIcons.chevronRight, size: 18, color: Colors.grey),
        onTap: () => Get.toNamed(route),
      ),
    );
  }
}