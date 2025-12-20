import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePick extends StatefulWidget {
  const ImagePick({super.key});

  @override
  State<ImagePick> createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  final ImagePicker picker = ImagePicker();
  File? image;
  void chooseOption() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text('Camera'),
                  onTap: () {
                    // pickImage(ImageSource.camera);

                    PickCropImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
                Divider(color: Colors.grey),
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Gallery'),
                  onTap: () {
                    // pickImage(ImageSource.gallery);
                    PickCropImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> pickImage(ImageSource source) async {
    final XFile? pickedFileGallery = await picker.pickImage(source: source);

    if (pickedFileGallery != null) {
      setState(() {
        image = File(pickedFileGallery.path);
      });
      log('Image selected: ${pickedFileGallery.path}==>image=$image');
    }
  }

  Future<void> PickCropImage(ImageSource source) async {
    final XFile? pickedFile = await picker.pickImage(source: source);
    if (pickedFile == null) return;
    final CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.deepPurple,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(title: 'Crop Image'),
      ],
    );
    if (croppedFile != null) {
      setState(() {
        image = File(croppedFile.path);
      });
      log('Cropped image selected: ${croppedFile.path}==>image=$image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Image Picker Example',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: image != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.file(image!, width: 200, height: 200),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        image = null;
                      });
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              )
            : Text('No image selected'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          log('chooseOption is clicked');
          chooseOption();
        },
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
