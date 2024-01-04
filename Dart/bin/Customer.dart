class Customer{
  late int id;
  late String fullName;
  late String birthday;
  late String address;
  late String phoneNumber;
  Customer(this.fullName, this.birthday, this.address, this.phoneNumber);

  Map<String, dynamic> toJson() {
    return {
      'fullname': fullName,
      'Birthday': birthday,
      'Address': address,
      'PhoneNumber': phoneNumber,
    };
  }

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      json['fullname'] as String,
      json['Birthday'] as String,
      json['Address'] as String,
      json['PhoneNumber'] as String,
    );
  }
}