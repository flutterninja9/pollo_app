class Constant {
  Constant._();

  static final _instance = Constant._();
  static Constant get instance => _instance;

  final String fontFamily = 'Inter';
  final String loggedInCacheKey = 'logged-in';
}
