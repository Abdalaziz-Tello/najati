class LoginFailureModel {
  final String status;
  final String message;
  final Map<String, List<String>> data;

  LoginFailureModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginFailureModel.fromJson(Map<String, dynamic> json) {
    return LoginFailureModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: (json['data'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, List<String>.from(value)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'message': message, 'data': data};
  }
}
