import 'package:app/services/camera_service.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/utils/constants.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';


class PreviewScreen extends StatefulWidget {
  final String imagePath;
  final ImageSourceType sourceType;

  const PreviewScreen({
    super.key,
    required this.imagePath,
    required this.sourceType,
  });

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  late File imageFile;
  @override
  void initState(){
    super.initState();
    imageFile=File(widget.imagePath);
  }

//-------------retake function---------------//


  Future <void> retakeImage() async{
    final image= await CameraService().pickFromCamera();

    if(image != null){
      Navigator.pushReplacement(
          context,
      MaterialPageRoute(builder:
          (_)=>PreviewScreen(
          imagePath: image.path,
          sourceType: ImageSourceType.camera,),
      ),
      );
    }
  }
  Future <void> CropImage() async{
    final cropped= await ImageCropper().cropImage(
        sourcePath: imageFile.path,
    uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'Crop',
        toolbarColor: Colors.black87,
        toolbarWidgetColor: Colors.white70,
        hideBottomControls: false,
        lockAspectRatio: false,
      ),
    ],
    );
    if(cropped !=null){
      setState(() {
        imageFile=File(cropped.path);
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.popUntil(context, (route) => route.isFirst);

            },
        ),
        title: const Text("Preview",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,

      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Image.file(
                    imageFile,
                    fit: BoxFit.contain,
                  ),
                )
            ),
            Container(
              padding: const EdgeInsets.all(13),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Row(
                children: [
                  if(widget.sourceType == ImageSourceType.camera)
                    Expanded(
                      child: CustomButton
                        (
                        text: "Retake",
                        onPressed: () =>retakeImage(),
                      ),
                    ),

                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomButton
                      (
                      text: "Crop",
                      onPressed: () =>CropImage(),
                    ),
                  ),

                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomButton
                      (
                      text: ("Done"),
                      onPressed: () {
                        print("Final image path: ${imageFile.path}");
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}