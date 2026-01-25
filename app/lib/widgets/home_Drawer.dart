import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool isDarkMode=false;
  @override
  Widget build(BuildContext context) {
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
                  value: isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                    });

                    // For now (later we connect real theme logic)
                    debugPrint("Dark mode: $isDarkMode");
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
