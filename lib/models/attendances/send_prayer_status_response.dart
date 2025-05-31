class SendPrayerStatusResponse {
  final List<Attendance> attendances;

  SendPrayerStatusResponse({required this.attendances});

  factory SendPrayerStatusResponse.fromJson(Map<String, dynamic> json) {
    return SendPrayerStatusResponse(
      attendances:
          (json['attendances'] as List)
              .map((item) => Attendance.fromJson(item))
              .toList(),
    );
  }
}

class Attendance {
  final int childId;
  final int prayerId;
  final int status;
  final String datetime;

  Attendance({
    required this.childId,
    required this.prayerId,
    required this.status,
    required this.datetime,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      childId: json['child_id'],
      prayerId: json['prayer_id'],
      status: json['status'],
      datetime: json['datetime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'child_id': childId,
      'prayer_id': prayerId,
      'status': status,
      'datetime': datetime,
    };
  }
}
