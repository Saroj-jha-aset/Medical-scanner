import 'dart:io';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_filex/open_filex.dart';

class ResultScreen extends StatelessWidget {
  final String filePath;

  const ResultScreen({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    final fileName = filePath.split('/').last;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.description, size: 80),
            const SizedBox(height: 20),

            Text(
              fileName,
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 30),

            // 🔵 Open File
            ElevatedButton(
              onPressed: () async {
                final result = await OpenFilex.open(filePath);
                print(result.message);
              },
              child: const Text("Open File"),
            ),

            const SizedBox(height: 15),

            // 🟢 Share File
            ElevatedButton(
              onPressed: () async {
                await Share.shareXFiles([XFile(filePath)]);
              },
              child: const Text("Share File"),
            ),
          ],
        ),
      ),
    );
  }
}