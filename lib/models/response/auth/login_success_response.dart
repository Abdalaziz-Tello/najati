class LoginResponseModel {
  final String status;
  final List<dynamic> data;

  LoginResponseModel({required this.status, required this.data});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      status: json['status'] ?? '',
      data: json['data'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'data': data};
  }
}
