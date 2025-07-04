import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const BackButton(),
          title: const Text("Orders"),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.transparent,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                child: Chip(
                  label: Text(
                    "Upcoming",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.orangeAccent,
                ),
              ),
              Tab(
                child: Chip(
                  label: Text("History"),
                  backgroundColor: Color(0xFFEFEFEF),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _upcomingTab(context),
            const Center(child: Text("No history orders.")),
          ],
        ),
      ),
    );
  }

  Widget _upcomingTab(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Top labels
              Row(
                children: [
                  _tag("OID: 10159", color: Colors.orange),
                  const SizedBox(width: 8),
                  _tag("1st Order"),
                  const SizedBox(width: 8),
                  _tag("New"),
                ],
              ),
              const SizedBox(height: 16),
              // Customer info
              Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage("assets/a.png"), // Placeholder
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Rahul Singh",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "21, Ravinagar, Ravinagar, Raipur, Chhattisgarh, India",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_up),
                ],
              ),
              const SizedBox(height: 16),
              // Order summary
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _orderInfo("10159", "Order ID"),
                  _orderInfo("₹4,319.50", "Amount"),
                  _orderInfo("COD", "Payment"),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(),
              // Action items
              _orderAction(Icons.local_shipping, "Track Order"),
              _orderAction(Icons.receipt_long, "View Invoice"),
              _orderAction(Icons.cancel_outlined, "Cancel Order"),
              _orderAction(Icons.qr_code, "Payment QR Code"),
              _orderAction(Icons.more_horiz, "More Information"),
              const SizedBox(height: 16),
              const Text(
                "Jul 4, 2025 11:20 PM",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tag(String label, {Color color = const Color(0xFFE0E0E0)}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }

  static const TextStyle labelStyle = TextStyle(
    color: Colors.grey,
    fontSize: 12,
  );

  static const TextStyle valueStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static Widget _orderInfo(String value, String label) {
    return Column(
      children: [
        Text(value, style: valueStyle),
        const SizedBox(height: 4),
        Text(label, style: labelStyle),
      ],
    );
  }

  Widget _orderAction(IconData icon, String title) {
    return ListTile(
      leading: CircleAvatar(
        radius: 16,
        backgroundColor: const Color(0xFFF3F3F3),
        child: Icon(icon, size: 18, color: Colors.black),
      ),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      onTap: () {},
    );
  }
}
