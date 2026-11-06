import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controllers/auth_controller.dart';
import 'controllers/promo_controller.dart'; // IMPORT THE PROMO CONTROLLER HERE

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopHeader(authController),
              _buildSearchBar(),
              _buildServiceGrid(),
              _buildPromotionSection(authController),
              const SizedBox(height: 140),
            ],
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: _buildBottomNav(authController),
    );
  }

  Widget _buildTopHeader(AuthController auth) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: "DRSB ", style: GoogleFonts.kantumruyPro(color: const Color(0xFF00529B), fontSize: 30, fontWeight: FontWeight.w900)),
                TextSpan(text: "EXPRESS", style: GoogleFonts.kantumruyPro(color: const Color(0xFFE31E24), fontSize: 30, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Row(
            children: [
              Obx(() => GestureDetector(
                onTap: () => auth.toggleLanguage(),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)]
                  ),
                  child: Text(auth.isKhmer.value ? "🇺🇸" : "🇰🇭", style: const TextStyle(fontSize: 22)),
                ),
              )),
              const SizedBox(width: 14),
              const Icon(LucideIcons.bell, color: Colors.black87, size: 28),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 15, offset: const Offset(0, 5))],
        ),
        child: TextField(
          style: GoogleFonts.kantumruyPro(fontSize: 16, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            prefixIcon: const Icon(LucideIcons.search, color: Colors.grey, size: 24),
            hintText: 'search_hint'.tr,
            hintStyle: GoogleFonts.kantumruyPro(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 18),
            suffixIcon: const Icon(LucideIcons.scan, color: Colors.blueAccent, size: 24),
          ),
        ),
      ),
    );
  }

  // --- REPLACE THESE TWO METHODS IN lib/dashboard.dart ---

  Widget _buildServiceGrid() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('our_services'.tr,
              style: GoogleFonts.kantumruyPro(fontWeight: FontWeight.w900, fontSize: 17, color: Colors.black87, letterSpacing: 1.0)),
          const SizedBox(height: 24),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 24,
            crossAxisSpacing: 20,
            children: [
              _serviceItem('my_id'.tr, LucideIcons.creditCard, Colors.orange, '/profile'),
              _serviceItem('wallet'.tr, LucideIcons.wallet, Colors.blue, '/wallet'),
              _serviceItem('support'.tr, LucideIcons.phoneCall, Colors.red, '/support'),
              _serviceItem('delivery'.tr, LucideIcons.truck, Colors.blueAccent, '/shipping'),

              // ADDED THE ARGUMENTS HERE to tell the next screen which one we clicked!
              _serviceItem('china_wh'.tr, LucideIcons.package, Colors.pink, '/warehouse', arg: 'china'),
              _serviceItem('vn_wh'.tr, LucideIcons.package, Colors.deepOrange, '/warehouse', arg: 'vn'),
            ],
          ),
        ],
      ),
    );
  }

  // Added the optional {String? arg} parameter
  Widget _serviceItem(String title, IconData icon, Color color, String route, {String? arg}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        // Pass the argument to GetX navigation
        onTap: () => Get.toNamed(route, arguments: arg),
        borderRadius: BorderRadius.circular(20),
        splashColor: color.withValues(alpha: 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: color.withValues(alpha: 0.1), blurRadius: 10, offset: const Offset(0, 4))],
              ),
              child: Icon(icon, color: color, size: 32),
            ),
            const SizedBox(height: 12),
            Text(title, textAlign: TextAlign.center, style: GoogleFonts.kantumruyPro(fontSize: 14, fontWeight: FontWeight.w800, color: const Color(0xFF1A1A1A))),
          ],
        ),
      ),
    );
  }

  // --- REVISED DYNAMIC PROMOTION SECTION ---
  Widget _buildPromotionSection(AuthController auth) {
    // Controller injected here to listen to image changes
    final PromoController promoCtrl = Get.put(PromoController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('promotions'.tr, style: GoogleFonts.kantumruyPro(fontWeight: FontWeight.w900, fontSize: 17, color: Colors.black87, letterSpacing: 1.0)),

              // Only Admin sees the button to open the form
              Obx(() => auth.currentUserRole.value == 'admin'
                  ? IconButton(
                icon: const Icon(LucideIcons.settings, color: Color(0xFFE31E24), size: 24),
                // Navigates to the new Manage Promos screen!
                onPressed: () => Get.toNamed('/manage-promos'),
              )
                  : const SizedBox.shrink()),
            ],
          ),
        ),
        const SizedBox(height: 15),

        // Horizontal Scrolling List of Promotions (No edit buttons here anymore)
        SizedBox(
          height: 200,
          child: Obx(() {
            if (promoCtrl.promoImages.isEmpty) {
              return Center(child: Text("No promotions available", style: GoogleFonts.kantumruyPro(color: Colors.grey)));
            }
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: promoCtrl.promoImages.length,
              itemBuilder: (context, index) {
                return _buildPromoCard(promoCtrl.promoImages[index]);
              },
            );
          }),
        ),
      ],
    );
  }

  // Clean, display-only card for the dashboard
  Widget _buildPromoCard(String imageUrl) {
    return Container(
      width: 320,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10, offset: const Offset(0, 5))],
      ),
    );
  }

  Widget _buildBottomNav(AuthController auth) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
      height: 85,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 20)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(LucideIcons.home, 'home'.tr, true, () => Get.offAllNamed('/dashboard')),
          _navItem(LucideIcons.shoppingCart, 'shop'.tr, false, () => Get.toNamed('/shop')),
          _navItem(LucideIcons.package, 'orders'.tr, false, () => Get.toNamed('/orders')),
          _navItem(LucideIcons.truck, 'shipping'.tr, false, () => Get.toNamed('/shipping')),
          _navItem(LucideIcons.user, 'account'.tr, false, () => _showAccountMenu(auth)),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool isActive, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isActive ? const Color(0xFFE31E24) : Colors.white38, size: isActive ? 28 : 24),
            const SizedBox(height: 6),
            Text(label, style: GoogleFonts.kantumruyPro(color: isActive ? Colors.white : Colors.white38, fontSize: 12, fontWeight: isActive ? FontWeight.bold : FontWeight.w600)),
            if (isActive)
              Container(margin: const EdgeInsets.only(top: 6), width: 5, height: 5, decoration: const BoxDecoration(color: Color(0xFFE31E24), shape: BoxShape.circle)),
          ],
        ),
      ),
    );
  }

  void _showAccountMenu(AuthController auth) {
    Get.bottomSheet(
      Material(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(LucideIcons.user, size: 28),
                title: Text('my_profile'.tr, style: GoogleFonts.kantumruyPro(fontSize: 18, fontWeight: FontWeight.bold)),
                onTap: () { Get.back(); Get.toNamed('/profile'); },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(LucideIcons.logOut, color: Colors.red, size: 28),
                title: Text('logout'.tr, style: GoogleFonts.kantumruyPro(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold)),
                onTap: () { Get.back(); auth.logout(); },
              ),
            ],
          ),
        ),
      ),
    );
  }
}