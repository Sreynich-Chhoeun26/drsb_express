import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('wallet'.tr, style: GoogleFonts.kantumruyPro(color: Colors.black, fontWeight: FontWeight.bold)),
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
            _buildVirtualCard(),
            const SizedBox(height: 25),
            _buildQuickActions(),
            const SizedBox(height: 30),
            _buildRecentTransactions(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // --- Premium Virtual Card ---
  Widget _buildVirtualCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFFE31E24), Color(0xFF9B1317)], // DRSB Red Gradient
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(color: const Color(0xFFE31E24).withValues(alpha: 0.3), blurRadius: 20, offset: const Offset(0, 10))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('total_balance'.tr, style: GoogleFonts.kantumruyPro(color: Colors.white70, fontSize: 14)),
              const Icon(LucideIcons.wallet, color: Colors.white70, size: 20),
            ],
          ),
          const SizedBox(height: 10),
          Text(
              "\$1,250.00",
              style: GoogleFonts.kantumruyPro(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w900, letterSpacing: 1.0)
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Wallet ID", style: GoogleFonts.kantumruyPro(color: Colors.white54, fontSize: 10)),
                  Text("**** **** **** 8899", style: GoogleFonts.kantumruyPro(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 2.0)),
                ],
              ),
              // Simulated Chip/Logo
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(8)),
                child: Text("DRSB Pay", style: GoogleFonts.kantumruyPro(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- Quick Actions Row ---
  Widget _buildQuickActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _actionButton(LucideIcons.plus, 'top_up'.tr, Colors.blue),
          _actionButton(LucideIcons.send, 'transfer'.tr, Colors.orange),
          _actionButton(LucideIcons.download, 'withdraw'.tr, Colors.green),
          _actionButton(LucideIcons.history, 'history'.tr, Colors.purple),
        ],
      ),
    );
  }

  Widget _actionButton(IconData icon, String label, Color color) {
    return Column(
      children: [
        InkWell(
          onTap: () => Get.snackbar(label, "$label feature coming soon!"),
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4))],
            ),
            child: Icon(icon, color: color, size: 28),
          ),
        ),
        const SizedBox(height: 10),
        Text(label, style: GoogleFonts.kantumruyPro(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black87)),
      ],
    );
  }

  // --- Recent Transactions List ---
  Widget _buildRecentTransactions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('recent_transactions'.tr, style: GoogleFonts.kantumruyPro(fontSize: 18, fontWeight: FontWeight.w900, color: Colors.black87)),
          const SizedBox(height: 15),
          _transactionTile("Shipping Fee - Thai WH", "Oct 24, 2026", "-\$15.50", false),
          _transactionTile("Top Up via ABA Bank", "Oct 22, 2026", "+\$100.00", true),
          _transactionTile("Order Payment #8821", "Oct 20, 2026", "-\$45.00", false),
          _transactionTile("Cashback Promo", "Oct 18, 2026", "+\$5.00", true),
        ],
      ),
    );
  }

  Widget _transactionTile(String title, String date, String amount, bool isIncome) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 8)],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isIncome ? Colors.green.withValues(alpha: 0.1) : Colors.red.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isIncome ? LucideIcons.arrowDownLeft : LucideIcons.arrowUpRight,
              color: isIncome ? Colors.green : Colors.red,
              size: 20,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.kantumruyPro(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Text(date, style: GoogleFonts.kantumruyPro(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Text(
            amount,
            style: GoogleFonts.kantumruyPro(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: isIncome ? Colors.green : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}