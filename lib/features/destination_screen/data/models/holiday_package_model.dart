class HolidayPackageModel {
  int? id;
  int? userId;
  String? title;
  int? noOfDays;
  String? destination;
  String? hotelCat;
  String? planType;
  List<String>? include;
  String? transportType;
  List<String>? startFrom;
  String? description;
  int? price;
  String? pricePer;
  String? cabName;
  List<String>? images;
  int? active;
  String? createdAt;
  String? updatedAt;

  HolidayPackageModel({
    this.id,
    this.userId,
    this.title,
    this.noOfDays,
    this.destination,
    this.hotelCat,
    this.planType,
    this.include,
    this.transportType,
    this.startFrom,
    this.description,
    this.price,
    this.pricePer,
    this.cabName,
    this.images,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  HolidayPackageModel copyWith({
    int? id,
    int? userId,
    String? title,
    int? noOfDays,
    String? destination,
    String? hotelCat,
    String? planType,
    List<String>? include,
    String? transportType,
    List<String>? startFrom,
    String? description,
    int? price,
    String? pricePer,
    String? cabName,
    List<String>? images,
    int? active,
    String? createdAt,
    String? updatedAt,
  }) {
    return HolidayPackageModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      noOfDays: noOfDays ?? this.noOfDays,
      destination: destination ?? this.destination,
      hotelCat: hotelCat ?? this.hotelCat,
      planType: planType ?? this.planType,
      include: include ?? this.include,
      transportType: transportType ?? this.transportType,
      startFrom: startFrom ?? this.startFrom,
      description: description ?? this.description,
      price: price ?? this.price,
      pricePer: pricePer ?? this.pricePer,
      cabName: cabName ?? this.cabName,
      images: images ?? this.images,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory HolidayPackageModel.fromJson(Map<String, dynamic> json) {
    return HolidayPackageModel(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      noOfDays: json['no_of_days'],
      destination: json['destination'],
      hotelCat: json['hotel_cat'],
      planType: json['plan_type'],
      include: json['include'] != null ? List<String>.from(json['include']) : null,
      transportType: json['transport_type'],
      startFrom: json['start_from'] != null ? List<String>.from(json['start_from']) : null,
      description: json['description'],
      price: json['price'],
      pricePer: json['price_per'],
      cabName: json['cab_name'],
      images: json['images'] != null ? List<String>.from(json['images']) : null,
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
      'destination': destination,
      'hotel_cat': hotelCat,
      'plan_type': planType,
      'include': include,
      'transport_type': transportType,
      'start_from': startFrom,
      'description': description,
      'price': price,
      'price_per': pricePer,
      'cab_name': cabName,
      'images': images,
      'active': active,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
