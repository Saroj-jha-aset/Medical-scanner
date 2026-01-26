import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle(context, "Introduction"),
            _sectionText(
              context,
              "This Privacy Policy explains how the Medical Report Scanner app "
                  "handles user data. By using this app, you agree to the practices "
                  "described in this policy.",
            ),

            const SizedBox(height: 16),

            _sectionTitle(context, "Data Collection"),
            _sectionText(
              context,
              "The app does not collect or store any personal information. "
                  "Images selected or captured by the user are used only for "
                  "processing and are not permanently stored by the app.",
            ),

            const SizedBox(height: 16),

            _sectionTitle(context, "Use of Images"),
            _sectionText(
              context,
              "Images provided by the user are processed solely for the purpose "
                  "of extracting and converting report data. The app does not share "
                  "these images with third parties without user consent.",
            ),

            const SizedBox(height: 16),

            _sectionTitle(context, "Third-Party Services"),
            _sectionText(
              context,
              "The app may use third-party libraries or services strictly for "
                  "functionality improvements. These services follow their own "
                  "privacy policies.",
            ),

            const SizedBox(height: 16),

            _sectionTitle(context, "Changes to This Policy"),
            _sectionText(
              context,
              "This Privacy Policy may be updated in the future. Any changes "
                  "will be reflected within the app.",
            ),

            const SizedBox(height: 24),

            Text(
              "Last updated: January 2026",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}



Widget _sectionTitle(BuildContext context, String text) {
  return Text(
    text,
    style: Theme.of(context).textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w600,
    ),
  );
}

Widget _sectionText(BuildContext context, String text) {
  return Text(
    text,
    style: Theme.of(context).textTheme.bodyMedium,
  );
}