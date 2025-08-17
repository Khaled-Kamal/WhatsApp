import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const WhatsAppAssessmentApp());
}

class WhatsAppAssessmentApp extends StatelessWidget {
  const WhatsAppAssessmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp-like',
      theme: buildLightTheme(),
      darkTheme: buildDarkTheme(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
