import 'package:flutter/material.dart';

extension BuildContextThemeX on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get screenSize => mediaQuery.size;

  EdgeInsets get viewPadding => mediaQuery.viewPadding;

  EdgeInsets get viewInsets => mediaQuery.viewInsets;

  bool get isKeyboardOpen => viewInsets.bottom > 0;

  void unfocus() => FocusScope.of(this).unfocus();
}
