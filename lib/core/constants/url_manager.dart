class UrlManager {
  // Base URLs
  static const String baseUrl =
      'https://najati.webmyidea.com'; // Replace with your actual base URL

  // Authentication endpoints
  static const String login = '$baseUrl/api/login';
  static const String logout = '$baseUrl/api/logout';
  static const String register = '$baseUrl/api/register';
  static const String verify = '$baseUrl/api/verify';
  static const String resend = '$baseUrl/api/resend';
  static const String refreshToken = '$baseUrl/api/refresh-token';

  // parent/reminder/departmnt
  static const String getParentReminder = 'api/child';
  static const String createParentReminder = 'api/reminders';

  // parent/child/departmnt
  static const String getChildren = '$baseUrl/api/children';
  static const String createChild = '$baseUrl/api/children';

  // Location/departmnt
  static const String getLocation = '$baseUrl/api/locations';

  // child/prayerTimes/departmnt
  static const String getReminder = '$baseUrl/api/reminders/reminderId';
  static const String sendInfoChild = '$baseUrl/api/attendances';
  // static const String getPrayersName = '$baseUrl/api/prayers';
  static const String getPrayerTimes = '$baseUrl/api/prayer-times';
  static const String getCharachters = '$baseUrl/api/characters';
  static const String createCharachter =
      '$baseUrl/api/children/1/choose_character/';

  // child/Eductional_Section/departmnt
  static const String getStoryFromId = '$baseUrl/api/educational_sections';
  static const String getSectionStory = '$baseUrl/api/educational_sections';
}
