import 'package:app/screens/preview_screen.dart';
import 'package:app/widgets/home_Drawer.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:app/widgets/diagona_clipper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app/services/camera_service.dart';
import 'package:app/services/file_picker_service.dart';
import 'package:app/utils/constants.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.themeMode,
    required this.onThemeChanged});

  // ✅ REQUIRED FIELD (this was missing earlier)
  final ThemeMode themeMode;
  final void Function(bool) onThemeChanged;

  final CameraService _cameraService = CameraService();
  final FilePickerService _filePickerService = FilePickerService();

  Future<void> scanWithCamera(BuildContext context) async {
    final image = await _cameraService.pickFromCamera();
    if (image != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PreviewScreen(
            imagePath: image.path,
            sourceType: ImageSourceType.camera,
          ),
        ),
      );
    }
  }

  Future<void> uploadDocument(BuildContext context) async {
    final image = await _filePickerService.pickFromGallery();
    if (image != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PreviewScreen(
            imagePath: image.path,
            sourceType: ImageSourceType.gallery,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,

      // ✅ Pass callback safely to Drawer
      drawer: NavBar(
          themeMode: themeMode,
          onThemeChanged: onThemeChanged),

      appBar: AppBar(backgroundColor: Colors.transparent),

      body: Stack(
        children: [
          Container(color: Theme.of(context).colorScheme.background,),

          ClipPath(
            clipper: DiagonalClipper(),
            child: Container(
              height: 380,
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
          ),

          Positioned(
            top: 80,
            left: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  "Report Scanner",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  "Scan reports and convert it to editable files",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),

          Positioned(
            top: height * 0.60,
            left: 24,
            right: 24,
            child: CustomButton(
              text: "Scan Report",
              onPressed: () => scanWithCamera(context),
            ),
          ),

          Positioned(
            top: height * 0.70,
            left: 24,
            right: 24,
            child: CustomButton(
              text: "Upload Document",
              onPressed: () => uploadDocument(context),
            ),
          ),
        ],
      ),
    );
  }
}
