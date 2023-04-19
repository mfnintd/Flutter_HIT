class Customer {
  Customer({
    required this.name,
    required this.type,
    required this.city,
    this.district,
    this.phoneNumber,
    this.address,
    this.email,
    this.taxcode,
    this.idNumber,
    this.description,
  });
  final String name;
  final int type;
  final String city;
  final String? district;
  final String? phoneNumber;
  final String? address;
  final String? email;
  final String? taxcode;
  final String? idNumber;
  final String? description;
}
