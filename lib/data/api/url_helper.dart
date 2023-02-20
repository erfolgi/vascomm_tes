class URL {
  static String get _baseUrl => "https://reqres.in/api";
  static String get baseUrl => _baseUrl;

  /// Auth
  static String get login => "$_baseUrl/login";
}