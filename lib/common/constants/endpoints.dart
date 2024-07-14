class Endpoints {
  Endpoints._();

  /* -------------------------------- Base URL -------------------------------- */
  static const String baseUrl = 'http://172.105.55.211/api';

  /* -------------------------------- Auth URL -------------------------------- */
  static const String loginUrl = '$baseUrl/loginApi.php';
  static const String getUserDetail = '$baseUrl/userApi.php';

  /* ------------------------------- Common URLs ------------------------------ */

  static const String packageApi = '$baseUrl/packageApi.php';
  static const String notificationApi = '$baseUrl/notificationApi.php';
}
