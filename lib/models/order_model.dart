class Order {
  final String id;
  final String customer;
  final String? driver;
  final String pickup;
  final String dropoff;
  final String status;
  final double price;
  final double progress;

  Order({
    required this.id,
    required this.customer,
    this.driver,
    required this.pickup,
    required this.dropoff,
    required this.status,
    required this.price,
    required this.progress,
  });

  // Factory constructor to create an Order from JSON (useful later for your Node.js API)
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      customer: json['customer'],
      driver: json['driver'],
      pickup: json['pickup'],
      dropoff: json['dropoff'],
      status: json['status'],
      price: json['price'].toDouble(),
      progress: json['progress'].toDouble(),
    );
  }
}