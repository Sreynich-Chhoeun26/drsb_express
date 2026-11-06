import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class WarehouseScreen extends StatelessWidget {
  const WarehouseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // READ THE ARGUMENT FROM THE DASHBOARD!
    final String? selectedWh = Get.arguments;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('warehouse_locations'.tr, style: GoogleFonts.kantumruyPro(color: Colors.black, fontWeight: FontWeight.bold)),
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
            _buildInfoBanner(),
            const SizedBox(height: 24),

            // --- ONLY SHOW CHINA IF 'china' WAS CLICKED ---
            if (selectedWh == 'china' || selectedWh == null) ...[
              _buildWarehouseCard(
                flag: "🇨🇳",
                title: 'china_wh'.tr,
                receiver: "DRSB-RONG",
                phone: "13800138000",
                address: "广东省 广州市 白云区 某某街道 DRSB物流中心",
                zipCode: "510000",
                color: const Color(0xFFE31E24), // DRSB Red
              ),
              const SizedBox(height: 20),
            ],

            // --- ONLY SHOW VIETNAM IF 'vn' WAS CLICKED ---
            if (selectedWh == 'vn' || selectedWh == null) ...[
              _buildWarehouseCard(
                flag: "🇻🇳",
                title: 'vn_wh'.tr,
                receiver: "DRSB-RONG",
                phone: "+84 90 123 4567",
                address: "Tầng 1, Tòa nhà ABC, Quận 1, Thành phố Hồ Chí Minh, Việt Nam",
                zipCode: "700000",
                color: const Color(0xFF00529B), // DRSB Blue
              ),
              const SizedBox(height: 50),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.orange.withValues(alpha: 0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(LucideIcons.info, color: Colors.orange, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('how_to_use_wh'.tr, style: GoogleFonts.kantumruyPro(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87)),
                const SizedBox(height: 4),
                Text('wh_instruction'.tr, style: GoogleFonts.kantumruyPro(color: Colors.black54, fontSize: 12, height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWarehouseCard({
    required String flag,
    required String title,
    required String receiver,
    required String phone,
    required String address,
    required String zipCode,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 15, offset: const Offset(0, 8))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.05),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            ),
            child: Row(
              children: [
                Text(flag, style: const TextStyle(fontSize: 24)),
                const SizedBox(width: 12),
                Text(title, style: GoogleFonts.kantumruyPro(fontSize: 18, fontWeight: FontWeight.w900, color: color)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _buildCopyableRow('receiver'.tr, receiver, color, isBold: true),
                const Divider(height: 24, color: Color(0xFFF0F0F0)),
                _buildCopyableRow('phone'.tr, phone, color),
                const Divider(height: 24, color: Color(0xFFF0F0F0)),
                _buildCopyableRow('address'.tr, address, color, maxLines: 2),
                const Divider(height: 24, color: Color(0xFFF0F0F0)),
                _buildCopyableRow('zip_code'.tr, zipCode, color),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCopyableRow(String label, String value, Color iconColor, {bool isBold = false, int maxLines = 1}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(label, style: GoogleFonts.kantumruyPro(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w600)),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            value,
            maxLines: maxLines,
            style: GoogleFonts.kantumruyPro(
              color: isBold ? Colors.black : Colors.black87,
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () {
            Clipboard.setData(ClipboardData(text: value));
            Get.snackbar(
              'copied'.tr,
              "$label ${'copied_to_clipboard'.tr}",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.black87,
              colorText: Colors.white,
              margin: const EdgeInsets.all(15),
              duration: const Duration(seconds: 2),
            );
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(color: iconColor.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
            child: Icon(LucideIcons.copy, color: iconColor, size: 16),
          ),
        ),
      ],
    );
  }
}