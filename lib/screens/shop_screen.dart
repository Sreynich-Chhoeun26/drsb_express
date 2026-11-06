import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('shop'.tr, style: GoogleFonts.kantumruyPro(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(LucideIcons.chevronLeft, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.shoppingCart, color: Colors.black),
            onPressed: () => Get.snackbar("Cart", "Your cart is currently empty"),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildCategories(),
          Expanded(
            child: _buildProductGrid(),
          ),
        ],
      ),
    );
  }

  // --- Search Bar ---
  Widget _buildSearchBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(24, 10, 24, 20),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: const Color(0xFFF8F9FB),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
        ),
        child: TextField(
          style: GoogleFonts.kantumruyPro(fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            prefixIcon: const Icon(LucideIcons.search, color: Colors.grey, size: 22),
            hintText: 'search_products'.tr,
            hintStyle: GoogleFonts.kantumruyPro(color: Colors.grey, fontSize: 14),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            suffixIcon: const Icon(LucideIcons.slidersHorizontal, color: Color(0xFF00529B), size: 20),
          ),
        ),
      ),
    );
  }

  // --- Horizontal Category Menu ---
  Widget _buildCategories() {
    final List<String> categories = ['all'.tr, 'electronics'.tr, 'fashion'.tr, 'home'.tr, 'beauty'.tr];

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isActive = index == 0; // Simulate "All" being the active tab
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: isActive ? const Color(0xFFE31E24) : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: isActive ? Colors.transparent : Colors.grey.withValues(alpha: 0.2)),
              boxShadow: isActive ? [BoxShadow(color: const Color(0xFFE31E24).withValues(alpha: 0.3), blurRadius: 8, offset: const Offset(0, 3))] : [],
            ),
            child: Center(
              child: Text(
                categories[index],
                style: GoogleFonts.kantumruyPro(
                  color: isActive ? Colors.white : Colors.black87,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // --- Product Grid ---
  Widget _buildProductGrid() {
    // Dummy product data
    final List<Map<String, dynamic>> products = [
      {"name": "Wireless Noise Cancelling Headphones", "price": "\$299.00", "rating": "4.8", "image": "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=1000&auto=format&fit=crop"},
      {"name": "Smart Fitness Watch Pro", "price": "\$149.50", "rating": "4.5", "image": "https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=1000&auto=format&fit=crop"},
      {"name": "Minimalist Leather Backpack", "price": "\$85.00", "rating": "4.9", "image": "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?q=80&w=1000&auto=format&fit=crop"},
      {"name": "Mechanical Gaming Keyboard", "price": "\$120.00", "rating": "4.7", "image": "https://images.unsplash.com/photo-1595225476474-87563907a212?q=80&w=1000&auto=format&fit=crop"},
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(24),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 items per row
        childAspectRatio: 0.70, // Adjust card height
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return _buildProductCard(products[index]);
      },
    );
  }

  // --- Modern Product Card ---
  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                image: DecorationImage(
                  image: NetworkImage(product['image']),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.9), shape: BoxShape.circle),
                      child: const Icon(LucideIcons.heart, color: Colors.grey, size: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Product Details
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(LucideIcons.star, color: Colors.orange, size: 12),
                    const SizedBox(width: 4),
                    Text(product['rating'], style: GoogleFonts.kantumruyPro(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  product['name'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.kantumruyPro(fontSize: 13, fontWeight: FontWeight.w700, height: 1.2),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product['price'],
                      style: GoogleFonts.kantumruyPro(fontSize: 15, fontWeight: FontWeight.w900, color: const Color(0xFFE31E24)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(color: const Color(0xFF00529B), borderRadius: BorderRadius.circular(8)),
                      child: const Icon(LucideIcons.plus, color: Colors.white, size: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}