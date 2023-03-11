class CustomerModel {
  late String date;
  late String name;
  late String time;
  late String number;
  late String total;
  late String queueId;
  late String customerId;

  CustomerModel({
    required this.date,
    required this.name,
    required this.time,
    required this.number,
    required this.total,
    required this.queueId,
    required this.customerId,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      name: json['customer_name'],
      time: json['created_at']
          .toString()
          .split("T")[1]
          .split(":")
          .sublist(0, 2)
          .join(':'),
      date: json['created_at'].toString().split("T")[0],
      number: json['mobile'].toString(),
      total: '3',
      queueId: json['id'].toString(),
      customerId: json['customer'].toString(),
    );
  }
}
