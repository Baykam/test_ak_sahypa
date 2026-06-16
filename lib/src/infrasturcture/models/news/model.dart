import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class NewsModel extends HiveObject {
  @HiveField(0)
  String? objectId;

  @HiveField(1)
  String? content;

  @HiveField(2)
  String? description;

  @HiveField(3)
  ParseDate? date;

  @HiveField(4)
  String? image;

  @HiveField(5)
  String? title;

  @HiveField(6)
  bool? isActive;

  @HiveField(7)
  DateTime? createdAt;

  @HiveField(8)
  DateTime? updatedAt;

  NewsModel({
    this.objectId,
    this.content,
    this.description,
    this.date,
    this.image,
    this.title,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  NewsModel copyWith({
    String? objectId,
    String? content,
    String? description,
    ParseDate? date,
    String? image,
    String? title,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return NewsModel(
      objectId: objectId ?? this.objectId,
      content: content ?? this.content,
      description: description ?? this.description,
      date: date ?? this.date,
      image: image ?? this.image,
      title: title ?? this.title,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      objectId: json['objectId'] ?? '',
      content: json['content'] ?? '',
      description: json['description'] ?? '',
      date: ParseDate.fromJson(json['date'] ?? {}),
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      isActive: json['isActive'] ?? false,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'objectId': objectId,
      'content': content,
      'description': description,
      'date': date?.toJson(),
      'image': image,
      'title': title,
      'isActive': isActive,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

@HiveType(typeId: 1) // Alt obje için farklı bir typeId (1) veriyoruz
class ParseDate {
  @HiveField(0)
  String? type;

  @HiveField(1)
  DateTime? iso;

  ParseDate({
    required this.type,
    required this.iso,
  });

  factory ParseDate.fromJson(Map<String, dynamic> json) {
    return ParseDate(
      type: json['__type'] ?? 'Date',
      iso: DateTime.parse(json['iso'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '__type': type,
      'iso': iso?.toIso8601String(),
    };
  }
}