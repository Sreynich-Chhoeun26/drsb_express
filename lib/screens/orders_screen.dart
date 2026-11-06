import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // DefaultTabController handles the swipeable tabs automatically!
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FB),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('my_orders'.tr, style: GoogleFonts.kantumruyPro(color: Colors.black, fontWeight: FontWeight.bold)),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(LucideIcons.chevronLeft, color: Colors.black),
            onPressed: () => Get.back(),
          ),
          actions: [
            IconButton(
              icon: const Icon(LucideIcons.search, color: Colors.black87),
              onPressed: () => Get.snackbar("Search", "Search orders coming soon!"),
            ),
          ],
          // --- The Scrollable Tab Menu ---
          bottom: TabBar(
            isScrollable: true,
            labelColor: const Color(0xFFE31E24), // DRSB Red
            unselectedLabelColor: Colors.grey,
            indicatorColor: const Color(0xFFE31E24),
            indicatorWeight: 3,
            labelStyle: GoogleFonts.kantumruyPro(fontWeight: FontWeight.bold, fontSize: 14),
            unselectedLabelStyle: GoogleFonts.kantumruyPro(fontWeight: FontWeight.w600, fontSize: 14),
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: 'all_orders'.tr),
              Tab(text: 'to_pay'.tr),
              Tab(text: 'to_ship'.tr),
              Tab(text: 'to_receive'.tr),
              Tab(text: 'completed'.tr),
            ],
          ),
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          children: [
            _buildOrderList(showAll: true),
            _buildOrderList(filterStatus: 'to_pay'),
            _buildOrderList(filterStatus: 'to_ship'),
            _buildOrderList(filterStatus: 'to_receive'),
            _buildOrderList(filterStatus: 'completed'),
          ],
        ),
      ),
    );
  }

  // --- The List of Orders ---
  Widget _buildOrderList({bool showAll = false, String? filterStatus}) {
    // Dummy Data - In a real app, this comes from your Spring Boot API
    final List<Map<String, dynamic>> orders = [
      {
        "id": "DRSB-882190",
        "store": "china_wh".tr,
        "status": 'to_receive'.tr,
        "statusCode": "to_receive",
        "statusColor": Colors.blue,
        "item": "Wireless Noise Cancelling Headphones",
        "image": "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=1000&auto=format&fit=crop",
        "qty": 1,
        "price": "\$299.00",
        "total": "\$314.50" // Including shipping
      },
      {
        "id": "DRSB-449201",
        "store": "Apple Official Store",
        "status": 'to_pay'.tr,
        "statusCode": "to_pay",
        "statusColor": Colors.orange,
        "item": "Smart Fitness Watch Pro",
        "image": "https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=1000&auto=format&fit=crop",
        "qty": 2,
        "price": "\$149.50",
        "total": "\$299.00"
      },
      {
        "id": "DRSB-110293",
        "store": "thai_wh".tr,
        "status": 'completed'.tr,
        "statusCode": "completed",
        "statusColor": Colors.green,
        "item": "Minimalist Leather Backpack",
        "image": "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?q=80&w=1000&auto=format&fit=crop",
        "qty": 1,
        "price": "\$85.00",
        "total": "\$90.00"
      }
    ];

    // Filter logic for the tabs
    final filteredOrders = showAll
        ? orders
        : orders.where((order) => order['statusCode'] == filterStatus).toList();

    if (filteredOrders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(LucideIcons.packageOpen, size: 80, color: Colors.black12),
            const SizedBox(height: 16),
            Text("No orders found", style: GoogleFonts.kantumruyPro(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      physics: const BouncingScrollPhysics(),
      itemCount: filteredOrders.length,
      itemBuilder: (context, index) {
        return _buildOrderCard(filteredOrders[index]);
      },
    );
  }

  // --- Beautiful Individual Order Card ---
  Widget _buildOrderCard(Map<String, dynamic> order) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 15, offset: const Offset(0, 5))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card Header: Store Name & Status
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(LucideIcons.store, size: 18, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text(order['store'], style: GoogleFonts.kantumruyPro(fontWeight: FontWeight.bold, fontSize: 14)),
                  ],
                ),
                Text(order['status'], style: GoogleFonts.kantumruyPro(color: order['statusColor'], fontWeight: FontWeight.bold, fontSize: 13)),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFF0F0F0)),

          // Card Body: Product Info
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(image: NetworkImage(order['image']), fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(order['item'], maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.kantumruyPro(fontWeight: FontWeight.w700, fontSize: 14)),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(order['price'], style: GoogleFonts.kantumruyPro(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14)),
                          Text("x${order['qty']}", style: GoogleFonts.kantumruyPro(color: Colors.grey, fontSize: 13)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFF0F0F0)),

          // Card Footer: Total Price & Actions
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${order['qty']} ${'items'.tr}", style: GoogleFonts.kantumruyPro(color: Colors.grey, fontSize: 13)),
                    Row(
                      children: [
                        Text('${'total_amount'.tr}: ', style: GoogleFonts.kantumruyPro(fontWeight: FontWeight.w600, fontSize: 14)),
                        Text(order['total'], style: GoogleFonts.kantumruyPro(color: const Color(0xFFE31E24), fontWeight: FontWeight.w900, fontSize: 16)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (order['statusCode'] == 'to_receive')
                      _buildActionButton('track_order'.tr, const Color(0xFF00529B), isOutlined: true),
                    const SizedBox(width: 10),
                    _buildActionButton(
                        order['statusCode'] == 'to_pay' ? 'Pay Now' : 'Buy Again',
                        const Color(0xFFE31E24)
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

  Widget _buildActionButton(String label, Color color, {bool isOutlined = false}) {
    return InkWell(
      onTap: () {
        if (label == 'track_order'.tr) {
          Get.toNamed('/shipping'); // Send them to the tracking screen!
        }
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isOutlined ? Colors.transparent : color,
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
            label,
            style: GoogleFonts.kantumruyPro(
                color: isOutlined ? color : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13
            )
        ),
      ),
    );
  }
}