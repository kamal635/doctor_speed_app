abstract final class AppDurations {
  static const Duration instant = Duration(milliseconds: 0);

  static const Duration fast = Duration(milliseconds: 150);
  static const Duration medium = Duration(milliseconds: 250);
  static const Duration slow = Duration(milliseconds: 350);

  static const Duration pageTransition = Duration(milliseconds: 300);
  static const Duration snackbar = Duration(milliseconds: 250);
  static const Duration sheet = Duration(milliseconds: 300);
  static const Duration dialog = Duration(milliseconds: 200);
}
