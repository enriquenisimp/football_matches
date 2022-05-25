class DataConstants{
  static const  String url = 'https://api.football-data.org';
  static const String v2 = '/v2';
  static const String competitions = '/competitions';
  static const String areas = '/areas';
  static const String standings = '/standings';
  static const String teams = '/teams';
  static const String matches = '/matches';
  static const String baseUrl = url+v2;
  static const String tokenKey = 'X-Auth-Token';
  static const String tokenValue = '8ff0ad0cb305461fbbef23207a4fb3fb';
  static String addParameter(String id)=> ("/" + id);
}