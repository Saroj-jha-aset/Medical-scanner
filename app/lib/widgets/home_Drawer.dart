import 'package:app/screens/privacy_policy_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/About_us.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget {
  final ThemeMode themeMode;
  final void Function(bool) onThemeChanged;

  const NavBar({
    super.key,
    required this.onThemeChanged,
    required this.themeMode,
  });

  @override
  Widget build(BuildContext context) {
    // 🔥 derive toggle value from REAL theme
    final bool isDark =
        themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);
    return Drawer(
      child: Column(
        children: [
          // 🔹 HEADER
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assests/image/coder.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(),
          ),

          // 🔹 SCROLLABLE LIST
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SwitchListTile(
                  secondary: const Icon(Icons.dark_mode_outlined),
                  title: const Text("Dark Mode"),
                  value: isDark,
                  onChanged: (value) {
                    // 🔥 request theme change
                    onThemeChanged(value);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.feedback_outlined),
                  title: const Text("Feedback"),
                  onTap: () {
                    Navigator.pop(context);
                    _showFeedbackSheet(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.privacy_tip_outlined),
                  title: const Text("Privacy Policy"),
                  onTap: () {
                    //to close drawer
                    Navigator.pop(context);

                    //Open Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrivacyPolicyScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.share_outlined),
                  title: const Text("Share"),
                  onTap: () {
                    Navigator.pop(context);
                    ShareApp();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person_2_outlined),
                  title: const Text("About us"),
                  onTap: () {
                    //to close drawer
                    Navigator.pop(context);

                    //Open Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AboutUs()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text("Version"),
                  onTap: () {
                    Navigator.pop(context);
                    showVersionDialog(context);
                  },
                ),
              ],
            ),
          ),

          // 🔹 FOOTER (ALWAYS AT BOTTOM)
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              'by moonlight 🌙',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                letterSpacing: 1.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showVersionDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("App Version"),
        content: const Text("Version 1.0.0\nBuild 1"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}

void ShareApp() {
  Future.delayed(Duration(milliseconds: 300), () {
    Share.share(
      "Try this Report Scanner App !"
      " it helps Scanvreport and convert them"
      "to digital files",
    );
  });
}


void _showFeedbackSheet(BuildContext context) {
  final TextEditingController feedbackController =
  TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 🔹 Optional icon (adds warmth)
              Icon(
                Icons.feedback_outlined,
                size: 36,
                color: Theme.of(context).colorScheme.primary,
              ),

              const SizedBox(height: 12),

              // 🔹 Title
              Text(
                "Send Feedback",
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 6),

              // 🔹 Subtitle
              Text(
                "We’d love to hear your thoughts or suggestions.",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              // 🔹 Input (keep full width for usability)
              TextField(
                controller: feedbackController,
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: "Write your feedback here...",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Action button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final feedbackText = feedbackController.text.trim();

                    if (feedbackText.isEmpty) {
                      return; // later you can show snackbar
                    }

                    final String body = Uri.encodeComponent(
                      'App: Medical Report Scanner\n'
                          'Platform: Android\n\n'
                          'Feedback:\n$feedbackText',
                    );

                    final Uri emailUri = Uri(
                      scheme: 'mailto',
                      path: 'moonlightstudio.pvt@gmail.com',
                      query: 'subject=App Feedback&body=$body',
                    );

                    Navigator.pop(context); // close bottom sheet

                    await launchUrl(
                      emailUri,
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  child: const Text("Send"),
                ),
              ),
            ],
          ),
        );
      }
  );
}