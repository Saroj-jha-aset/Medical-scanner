import 'package:flutter/material.dart';

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
                MediaQuery
                    .of(context)
                    .platformBrightness == Brightness.dark);
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
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.privacy_tip_outlined),
                  title: const Text("Privacy Policy"),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.share_outlined),
                  title: const Text("Share"),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.person_2_outlined),
                  title: const Text("About us"),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text("Version"),
                  onTap: () {},
                ),
              ],
            ),
          ),

          // 🔹 FOOTER (ALWAYS AT BOTTOM)
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              'by moon light 🌙',
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
