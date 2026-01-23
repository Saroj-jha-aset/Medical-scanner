import 'utils/constants.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main(){
  runApp(const ScannerApp());
}

class ScannerApp extends StatelessWidget {
  const ScannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
