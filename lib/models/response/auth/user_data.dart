// class UserData {
//   final int id;
//   final String name;
//   final String phone;
//   final String? image;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   const UserData({
//     required this.id,
//     required this.name,
//     required this.phone,
//     this.image,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory UserData.fromJson(Map<String, dynamic> json) => UserData(
//     id: json['id'],
//     name: json['name'],
//     phone: json['phone'],
//     image: json['image'],
//     createdAt: DateTime.parse(json['created_at']),
//     updatedAt: DateTime.parse(json['updated_at']),
//   );
// }
