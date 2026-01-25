import 'package:app/theme/app_theme.dart';

import 'utils/constants.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main(){
  runApp(const ScannerApp());
}

class ScannerApp extends StatefulWidget {
  const ScannerApp({super.key});

  @override
  State<ScannerApp> createState() => _ScannerAppState();
}

class _ScannerAppState extends State<ScannerApp> {
  ThemeMode themeMode=ThemeMode.system;

  void changeTheme(bool isDark){
    setState(() {
      themeMode= isDark?  ThemeMode.dark :ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(onThemeChanged: changeTheme, themeMode: themeMode,),
    );
  }
}
