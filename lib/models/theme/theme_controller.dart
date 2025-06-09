class ThemeController {
  static final ThemeController _instance = ThemeController._internal();

  factory ThemeController() => _instance;

  ThemeController._internal();

  bool isDarkMode = false;

  void toggle() {
    isDarkMode = !isDarkMode;
  }

  void set(bool value) {
    isDarkMode = value;
  }
}
