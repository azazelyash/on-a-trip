class NotificationModel {
  final int? id;
  final int? userId;
  final String? title;
  final String? description;
  final String? image;
  final int? seen;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  NotificationModel({
    this.id,
    this.userId,
    this.title,
    this.description,
    this.image,
    this.seen,
    this.createdAt,
    this.updatedAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      seen: json['seen'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'description': description,
      'image': image,
      'seen': seen,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  NotificationModel copyWith({
    int? id,
    int? userId,
    String? title,
    String? description,
    String? image,
    int? seen,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      seen: seen ?? this.seen,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
