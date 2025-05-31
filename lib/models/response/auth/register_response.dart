class RegisterResponseModel {
  final String status;
  final List<dynamic> data;

  RegisterResponseModel({required this.status, required this.data});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      status: json['status'] ?? '',
      data: json['data'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'data': data};
  }
}
