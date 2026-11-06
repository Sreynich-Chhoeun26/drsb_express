import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/promo_controller.dart';

class ManagePromosScreen extends StatelessWidget {
  const ManagePromosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject the controller
    final PromoController promoCtrl = Get.put(PromoController());
    final TextEditingController urlController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Manage Promotions", style: GoogleFonts.kantumruyPro(color: Colors.black, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(LucideIcons.chevronLeft, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Add New Promotion", style: GoogleFonts.kantumruyPro(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // --- THE FORM ---
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)],
              ),
              child: TextField(
                controller: urlController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(LucideIcons.image, color: Colors.blueAccent),
                  hintText: "Paste Image URL here...",
                  hintStyle: GoogleFonts.kantumruyPro(color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 18),
                  suffixIcon: IconButton(
                    icon: const Icon(LucideIcons.plusCircle, color: Color(0xFFE31E24)),
                    onPressed: () {
                      promoCtrl.addPromo(urlController.text);
                      urlController.clear(); // Clear form after adding
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            Text("Current Active Promotions", style: GoogleFonts.kantumruyPro(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // --- THE LIST ---
            Expanded(
              child: Obx(() {
                if (promoCtrl.promoImages.isEmpty) {
                  return const Center(child: Text("No promotions active."));
                }
                return ListView.builder(
                  itemCount: promoCtrl.promoImages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(promoCtrl.promoImages[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black.withValues(alpha: 0.3), // Dark overlay to see buttons better
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                    icon: const Icon(LucideIcons.edit3, color: Colors.blue, size: 18),
                                    onPressed: () => _showEditDialog(promoCtrl, index, promoCtrl.promoImages[index]),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                    icon: const Icon(LucideIcons.trash2, color: Colors.red, size: 18),
                                    onPressed: () => promoCtrl.deletePromo(index),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  // Edit Dialog logic kept inside the management screen
  void _showEditDialog(PromoController promoCtrl, int index, String currentUrl) {
    TextEditingController editController = TextEditingController(text: currentUrl);
    Get.defaultDialog(
      title: "Edit Image URL",
      content: TextField(controller: editController, decoration: const InputDecoration(border: OutlineInputBorder())),
      confirm: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE31E24)),
        onPressed: () {
          promoCtrl.updatePromo(index, editController.text);
          Get.back();
        },
        child: const Text("Update", style: TextStyle(color: Colors.white)),
      ),
      cancel: TextButton(onPressed: () => Get.back(), child: const Text("Cancel")),
    );
  }
}