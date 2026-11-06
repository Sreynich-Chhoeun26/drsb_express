import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class ShippingScreen extends StatelessWidget {
  const ShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('shipping'.tr, style: GoogleFonts.kantumruyPro(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(LucideIcons.chevronLeft, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildTrackingSearch(),
            const SizedBox(height: 30),
            _buildActiveShipment(),
            const SizedBox(height: 30),
            _buildShippingMethods(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // --- Tracking Search Bar ---
  Widget _buildTrackingSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('track_package'.tr, style: GoogleFonts.kantumruyPro(fontSize: 18, fontWeight: FontWeight.w900, color: Colors.black87)),
          const SizedBox(height: 15),
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 15, offset: const Offset(0, 5))],
            ),
            child: TextField(
              style: GoogleFonts.kantumruyPro(fontSize: 16, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                prefixIcon: const Icon(LucideIcons.packageSearch, color: Color(0xFFE31E24), size: 24),
                hintText: 'enter_tracking'.tr,
                hintStyle: GoogleFonts.kantumruyPro(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 18),
                suffixIcon: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE31E24),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(color: const Color(0xFFE31E24).withValues(alpha: 0.3), blurRadius: 8, offset: const Offset(0, 3))],
                  ),
                  child: IconButton(
                    icon: const Icon(LucideIcons.arrowRight, color: Colors.white, size: 20),
                    onPressed: () => Get.snackbar("Tracking", "Searching for package..."),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Visual Shipment Tracker ---
  Widget _buildActiveShipment() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('active_shipments'.tr, style: GoogleFonts.kantumruyPro(fontSize: 18, fontWeight: FontWeight.w900, color: Colors.black87)),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 15, offset: const Offset(0, 8))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(color: Colors.blue.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(20)),
                      child: Text('in_transit'.tr, style: GoogleFonts.kantumruyPro(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                    Text("DRSB-882190", style: GoogleFonts.kantumruyPro(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 25),

                // Visual Progress Line
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildRoutePoint("Guangzhou", "China", true),
                    const Expanded(child: Divider(color: Colors.blue, thickness: 2, indent: 10, endIndent: 10)),
                    const Icon(LucideIcons.truck, color: Colors.blue, size: 24),
                    const Expanded(child: Divider(color: Colors.grey, thickness: 2, indent: 10, endIndent: 10)),
                    _buildRoutePoint("Phnom Penh", "Cambodia", false),
                  ],
                ),

                const SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: const Color(0xFFF8F9FB), borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      const Icon(LucideIcons.calendarClock, color: Colors.orange, size: 20),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('expected_delivery'.tr, style: GoogleFonts.kantumruyPro(color: Colors.grey, fontSize: 12)),
                            Text("Feb 28, 2026", style: GoogleFonts.kantumruyPro(fontWeight: FontWeight.bold, fontSize: 14)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoutePoint(String city, String country, bool isPassed) {
    return Column(
      children: [
        Container(
          height: 16,
          width: 16,
          decoration: BoxDecoration(
            color: isPassed ? Colors.blue : Colors.white,
            border: Border.all(color: isPassed ? Colors.blue : Colors.grey.shade300, width: 3),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 8),
        Text(city, style: GoogleFonts.kantumruyPro(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black87)),
        Text(country, style: GoogleFonts.kantumruyPro(color: Colors.grey, fontSize: 10)),
      ],
    );
  }

  // --- Shipping Methods Cards ---
  Widget _buildShippingMethods() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('shipping_methods'.tr, style: GoogleFonts.kantumruyPro(fontSize: 18, fontWeight: FontWeight.w900, color: Colors.black87)),
          const SizedBox(height: 15),
          Row(
            children: [
              _methodCard(LucideIcons.plane, 'air_freight'.tr, "3-5 Days", Colors.blue),
              const SizedBox(width: 15),
              _methodCard(LucideIcons.ship, 'sea_freight'.tr, "10-15 Days", Colors.teal),
            ],
          ),
        ],
      ),
    );
  }

  Widget _methodCard(IconData icon, String title, String time, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 5))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(height: 15),
            Text(title, style: GoogleFonts.kantumruyPro(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 4),
            Text(time, style: GoogleFonts.kantumruyPro(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}