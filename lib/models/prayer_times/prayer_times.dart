class GetPrayerTimesResponse {
  final String status;
  final PrayerData data;

  GetPrayerTimesResponse({required this.status, required this.data});

  factory GetPrayerTimesResponse.fromJson(Map<String, dynamic> json) {
    return GetPrayerTimesResponse(
      status: json['status'],
      data: PrayerData.fromJson(json['data']),
    );
  }
}

class PrayerData {
  final String date;
  final PrayerTimes prayerTimes;

  PrayerData({required this.date, required this.prayerTimes});

  factory PrayerData.fromJson(Map<String, dynamic> json) {
    return PrayerData(
      date: json['date'],
      prayerTimes: PrayerTimes.fromJson(json['prayer_times']),
    );
  }
}

class PrayerTimes {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String sunset;
  final String maghrib;
  final String isha;
  final String imsak;
  final String midnight;
  final String firstThird;
  final String lastThird;

  PrayerTimes({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.imsak,
    required this.midnight,
    required this.firstThird,
    required this.lastThird,
  });

  factory PrayerTimes.fromJson(Map<String, dynamic> json) {
    return PrayerTimes(
      fajr: json['Fajr'],
      sunrise: json['Sunrise'],
      dhuhr: json['Dhuhr'],
      asr: json['Asr'],
      sunset: json['Sunset'],
      maghrib: json['Maghrib'],
      isha: json['Isha'],
      imsak: json['Imsak'],
      midnight: json['Midnight'],
      firstThird: json['Firstthird'],
      lastThird: json['Lastthird'],
    );
  }
}
