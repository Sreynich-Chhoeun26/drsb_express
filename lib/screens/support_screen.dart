import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('help_center'.tr, style: GoogleFonts.kantumruyPro(color: Colors.black, fontWeight: FontWeight.bold)),
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
            _buildHeroSection(),
            const SizedBox(height: 24),
            _buildContactOptions(),
            const SizedBox(height: 30),
            _buildFAQSection(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // --- Premium Blue Gradient Hero ---
  Widget _buildHeroSection() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFF00529B), Color(0xFF00386B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(color: const Color(0xFF00529B).withValues(alpha: 0.3), blurRadius: 15, offset: const Offset(0, 8))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), shape: BoxShape.circle),
            child: const Icon(LucideIcons.headphones, color: Colors.white, size: 32),
          ),
          const SizedBox(height: 16),
          Text('hi_how_can_we_help'.tr, style: GoogleFonts.kantumruyPro(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('support_subtitle'.tr, style: GoogleFonts.kantumruyPro(color: Colors.white70, fontSize: 14)),
        ],
      ),
    );
  }

  // --- Interactive Contact Grid ---
  Widget _buildContactOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('quick_contact'.tr, style: GoogleFonts.kantumruyPro(fontSize: 16, fontWeight: FontWeight.w900, color: Colors.black87)),
          const SizedBox(height: 16),
          Row(
            children: [
              _contactCard(LucideIcons.messageCircle, 'live_chat'.tr, Colors.blue, () => Get.snackbar("Chat", "Connecting to agent...")),
              const SizedBox(width: 15),
              _contactCard(LucideIcons.phone, 'call_us'.tr, Colors.green, () => Get.snackbar("Call", "Dialing 1800-DRSB...")),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              _contactCard(LucideIcons.mail, 'email_us'.tr, Colors.orange, () => Get.snackbar("Email", "Opening mail app...")),
              const SizedBox(width: 15),
              _contactCard(LucideIcons.send, 'telegram'.tr, Colors.lightBlue, () => Get.snackbar("Telegram", "Opening Telegram...")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _contactCard(IconData icon, String title, Color color, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4))],
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: color.withValues(alpha: 0.1), shape: BoxShape.circle),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(height: 12),
              Text(title, style: GoogleFonts.kantumruyPro(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87)),
            ],
          ),
        ),
      ),
    );
  }

  // --- Expanding FAQ Section ---
  Widget _buildFAQSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('faq'.tr, style: GoogleFonts.kantumruyPro(fontSize: 16, fontWeight: FontWeight.w900, color: Colors.black87)),
          const SizedBox(height: 16),
          _faqItem('faq_1'.tr, 'faq_1_ans'.tr),
          _faqItem('faq_2'.tr, 'faq_2_ans'.tr),
          _faqItem('faq_3'.tr, 'faq_3_ans'.tr),
        ],
      ),
    );
  }

  Widget _faqItem(String question, String answer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10)],
      ),
      // ExpansionTile handles the open/close animation automatically!
      child: ExpansionTile(
        collapsedIconColor: const Color(0xFFE31E24),
        iconColor: const Color(0xFFE31E24),
        title: Text(question, style: GoogleFonts.kantumruyPro(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.black87)),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(answer, style: GoogleFonts.kantumruyPro(color: Colors.grey, fontSize: 13, height: 1.5)),
          ),
        ],
      ),
    );
  }
}