class HotelPackageModel {
  int? id;
  int? userId;
  String? title;
  int? noOfDays;
  String? address;
  List<String>? includes;
  String? planType;
  List<String>? startFrom;
  String? transportType;
  String? cabName;
  String? description;
  int? price;
  String? pricePer;
  List<String>? image;
  int? active;
  String? createdAt;
  String? updatedAt;

  HotelPackageModel({
    this.id,
    this.userId,
    this.title,
    this.noOfDays,
    this.address,
    this.includes,
    this.planType,
    this.startFrom,
    this.transportType,
    this.cabName,
    this.description,
    this.price,
    this.pricePer,
    this.image,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  HotelPackageModel copyWith({
    int? id,
    int? userId,
    String? title,
    int? noOfDays,
    String? address,
    List<String>? includes,
    String? planType,
    List<String>? startFrom,
    String? transportType,
    String? cabName,
    String? description,
    int? price,
    String? pricePer,
    List<String>? image,
    int? active,
    String? createdAt,
    String? updatedAt,
  }) {
    return HotelPackageModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      noOfDays: noOfDays ?? this.noOfDays,
      address: address ?? this.address,
      includes: includes ?? this.includes,
      planType: planType ?? this.planType,
      startFrom: startFrom ?? this.startFrom,
      transportType: transportType ?? this.transportType,
      cabName: cabName ?? this.cabName,
      description: description ?? this.description,
      price: price ?? this.price,
      pricePer: pricePer ?? this.pricePer,
      image: image ?? this.image,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory HotelPackageModel.fromJson(Map<String, dynamic> json) {
    return HotelPackageModel(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      noOfDays: json['no_of_days'],
      address: json['address'],
      includes: json['includes'] != null ? List<String>.from(json['includes']) : null,
      planType: json['plan_type'],
      startFrom: json['start_from'] != null ? List<String>.from(json['start_from']) : null,
      transportType: json['transport_type'],
      cabName: json['cab_name'],
      description: json['description'],
      price: json['price'],
      pricePer: json['price_per'],
      image: json['image'] != null ? List<String>.from(json['image']) : null,
      active: json['active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'no_of_days': noOfDays,
      'address': address,
      'includes': includes,
      'plan_type': planType,
      'start_from': startFrom,
      'transport_type': transportType,
      'cab_name': cabName,
      'description': description,
      'price': price,
      'price_per': pricePer,
      'image': image,
      'active': active,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
