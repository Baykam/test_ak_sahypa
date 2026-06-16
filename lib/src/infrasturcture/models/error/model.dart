class ErrorModel {
  int? code;
  String? error;

  ErrorModel({
    this.code,
    this.error,
  });

  // Factory constructor to create an instance from JSON
  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      code: json['code'] ?? 0,
      error: json['error'] ?? '',
    );
  }

  // Method to convert an instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'error': error,
    };
  }
}