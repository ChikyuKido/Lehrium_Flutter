import 'package:dynamic_color/dynamic_color.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lehrium_flutter/views/home_page.dart';
import 'package:lehrium_flutter/views/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      ThemeData data = FlexThemeData.dark(
          useMaterial3: true,
          colorScheme:  darkColorScheme,
          scheme: null ,
          typography: Typography.material2021(
              platform: defaultTargetPlatform));

      return MaterialApp(
        title: 'Scrobblium',
        darkTheme: data,
        theme: data,
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: const RegisterPage(),
      );
    }
    );
  }
}