import 'package:dio/dio.dart';

class VerifyRequestModel {
  final int phone;
  final int code;
  final int roleId;

  VerifyRequestModel({
    required this.phone,
    required this.code,
    required this.roleId,
  });

  FormData toFormData() {
    return FormData.fromMap({'phone': phone, 'code': code, 'role_id': roleId});
  }
}
