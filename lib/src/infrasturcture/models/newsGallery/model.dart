import 'package:ak_sahypa_test/src/infrasturcture/models/index.dart';

class NewsGalleryModel {
  String? objectId;
  NewsModel? news;
  int? order;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  NewsGalleryModel({
    this.objectId,
    this.news,
    this.order,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  // Factory constructor to create an instance from JSON
  factory NewsGalleryModel.fromJson(Map<String, dynamic> json) {
    return NewsGalleryModel(
      objectId: json['objectId'] ?? '',
      news: NewsModel.fromJson(json['news'] ?? {}),
      order: json['order'] ?? 0,
      image: json['image'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  // Method to convert an instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'objectId': objectId,
      'news': news?.toJson(),
      'order': order,
      'image': image,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
//
// // Helper class to handle Parse Pointer references
// class ParsePointer {
//   String? type;
//   String? className;
//   String? objectId;
//
//   ParsePointer({
//     this.type,
//     this.className,
//     this.objectId,
//   });
//
//   factory ParsePointer.fromJson(Map<String, dynamic> json) {
//     return ParsePointer(
//       type: json['__type'] ?? 'Pointer',
//       className: json['className'] ?? '',
//       objectId: json['objectId'] ?? '',
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       '__type': type,
//       'className': className,
//       'objectId': objectId,
//     };
//   }
// }