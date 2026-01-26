import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "About Us",
          style: TextStyle(
              fontWeight: FontWeight.bold,

          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🔹 App Icon / Illustration
            Icon(
              Icons.document_scanner_outlined,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 16),

            // 🔹 App Name
            Text(
              "Medical Report Scanner",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            // 🔹 Short description
            Text(
              "Scan medical reports and convert them into editable digital files with ease.",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),

            // 🔹 Feature highlights
            _infoRow(
              context,
              Icons.camera_alt_outlined,
              "Scan reports using camera",
            ),
            _infoRow(
              context,
              Icons.upload_file_outlined,
              "Upload reports from gallery",
            ),
            _infoRow(
              context,
              Icons.table_chart_outlined,
              "Convert reports to Excel format",
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),

            _infoRow(
              context,
              Icons.perm_device_info,
              "Contact us for any kind of Software Service",
            ),
            _infoRow(
              context,
              Icons.arrow_circle_right_outlined,
              "App Development ",
            ),
            _infoRow(
              context,
              Icons.arrow_circle_right_outlined,
              "Web App/Website development",
            ),
            _infoRow(
              context,
              Icons.mail,
              "Mail: moonlightstudio.pvt@gmail.com",
            ),



            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),

            Text(
              "Developed by",
              style: Theme.of(context).textTheme.bodySmall,
            ),

            const SizedBox(height: 12),

            _teamMember(context, "Saroj Jha"),
            _teamMember(context, "Abu Talib"),
            _teamMember(context, "Shivam Jha"),

            const SizedBox(height: 16),
            Text(
              " MoonLight🌙",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),

            Text(
                  "Version 1.0.0",
              style: Theme.of(context).textTheme.bodySmall,
            ),

          ],
        ),
      ),
    );
  }
}
Widget _infoRow(BuildContext context, IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children: [
        Icon(
          icon,
          size: 22,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    ),
  );
}

Widget _teamMember(BuildContext context, String name) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.person_outline,
          size: 20,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 8),
        Text(
          name,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

