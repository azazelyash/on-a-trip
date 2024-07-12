class TransportPackageModel {
  int? id;
  int? userId;
  String? title;
  int? noOfDays;
  String? destination;
  String? transportType;
  int? price;
  String? pricePer;
  String? description;
  int? active;
  List<String>? startFrom;
  List<String>? includes;
  List<String>? image;
  String? createdAt;
  String? updatedAt;

  TransportPackageModel({
    this.id,
    this.userId,
    this.title,
    this.noOfDays,
    this.destination,
    this.transportType,
    this.price,
    this.pricePer,
    this.description,
    this.active,
    this.startFrom,
    this.includes,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  TransportPackageModel copyWith({
    int? id,
    int? userId,
    String? title,
    int? noOfDays,
    String? destination,
    String? transportType,
    int? price,
    String? pricePer,
    String? description,
    int? active,
    List<String>? startFrom,
    List<String>? includes,
    List<String>? image,
    String? createdAt,
    String? updatedAt,
  }) {
    return TransportPackageModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      noOfDays: noOfDays ?? this.noOfDays,
      destination: destination ?? this.destination,
      transportType: transportType ?? this.transportType,
      price: price ?? this.price,
      pricePer: pricePer ?? this.pricePer,
      description: description ?? this.description,
      active: active ?? this.active,
      startFrom: startFrom ?? this.startFrom,
      includes: includes ?? this.includes,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory TransportPackageModel.fromJson(Map<String, dynamic> json) {
    return TransportPackageModel(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      noOfDays: json['no_of_days'],
      destination: json['destination'],
      transportType: json['transport_type'],
      price: json['price'],
      pricePer: json['price_per'],
      description: json['description'],
      active: json['active'],
      startFrom: json['start_from'] != null ? List<String>.from(json['start_from']) : null,
      includes: json['includes'] != null ? List<String>.from(json['includes']) : null,
      image: json['image'] != null ? List<String>.from(json['image']) : null,
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
      'destination': destination,
      'transport_type': transportType,
      'price': price,
      'price_per': pricePer,
      'description': description,
      'active': active,
      'start_from': startFrom,
      'includes': includes,
      'image': image,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
