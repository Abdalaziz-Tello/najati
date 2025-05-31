class CreateReminderResponse {
  final String status;
  final ReminderData data;

  CreateReminderResponse({required this.status, required this.data});

  factory CreateReminderResponse.fromJson(Map<String, dynamic> json) {
    return CreateReminderResponse(
      status: json['status'],
      data: ReminderData.fromJson(json['data']),
    );
  }
}

class ReminderData {
  final int id;
  final Prayer prayer;
  final int minutes;

  ReminderData({required this.id, required this.prayer, required this.minutes});

  factory ReminderData.fromJson(Map<String, dynamic> json) {
    return ReminderData(
      id: json['id'],
      prayer: Prayer.fromJson(json['prayer']),
      minutes: json['minutes'],
    );
  }
}

class Prayer {
  final int id;
  final String name;
  final String type;

  Prayer({required this.id, required this.name, required this.type});

  factory Prayer.fromJson(Map<String, dynamic> json) {
    return Prayer(id: json['id'], name: json['name'], type: json['type']);
  }
}
