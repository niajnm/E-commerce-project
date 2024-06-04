import 'dart:io';

import 'package:e_commerce/app/core/values/app_colors.dart';
import 'package:e_commerce/app/core/values/app_icons.dart';
import 'package:e_commerce/app/module/home/widget/image/asset_Image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class SingleImagePicker extends StatefulWidget {
  final Function(File?) returnValue;
  final String? imageUrl;
  final bool isUpdateMode; // Flag to indicate whether it's in "update" mode
  final bool allowEditing; // Flag to allow editing images

  SingleImagePicker({
    required this.returnValue,
    this.imageUrl,
    this.isUpdateMode = false,
    this.allowEditing = true, // By default, allow editing
    Key? key,
  }) : super(key: key);

  @override
  State<SingleImagePicker> createState() => _SingleImagePickerState();
}

class _SingleImagePickerState extends State<SingleImagePicker> {
  File? _image;
  bool isEditing = false;
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    if (widget.imageUrl != null) {
      isEditing = true;
    }
  }

  Future openImagePicker() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
      maxHeight: 1000,
      maxWidth: 1000,
      requestFullMetadata: true,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        isEditing = true;
        widget.returnValue(_image);
      });
    }
  }

  void _editImage() {
    openImagePicker();
  }

  void _pickImagePopUp() async {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 200.w,
            color: AppColors.primaryGreen01,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.camera,
                            size: 30.w, color: AppColors.primaryGreen02),
                        SizedBox(width: 10.w),
                        const Text("Camera",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                    onTap: () => {_pickFromCamera()},
                  ),
                  Divider(color: AppColors.primaryGreen03),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.image,
                            size: 30.w, color: AppColors.primaryGreen01),
                        SizedBox(width: 8.w),
                        const Text("Gallery",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                    onTap: () => {_pickFromGallery()},
                  ),
                ]),
          );
        });
  }

  void _pickFromCamera() async {
    try {
      BuildContext? localContext = context; // Capture the context

      // ignore: deprecated_member_use
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);

      // Check if the localContext is still valid
      if (localContext != null && mounted) {
        setState(() {
          _imageFile = pickedFile!;
        });

        // widget.uploadedImage!(pickedFile, 'camera');
        Navigator.of(localContext).pop();
      }
    } catch (error) {
      //log("$error");
    }
  }

  void _pickFromGallery() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _onTap();
      },
      child: _container(),
    );
  }

  void _onTap() {
    if (widget.allowEditing) {
      if (isEditing) {
        _editImage();
      } else {
        openImagePicker();
      }
    }
  }

  Widget _container() {
    return Container(
      height: 150.h,
      width: 100.h,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: AppColors.neutral300),
      ),
      child: Stack(
        children: [
          if (widget.imageUrl != null) _networkImage(),
          if (_image != null) _fileImage(),
          if (widget.allowEditing && isEditing) _editImageIcon(),
          if (!isEditing && widget.allowEditing) _addImageIcon(),
        ],
      ),
    );
  }

  Widget _networkImage() {
    return Image.network(
      widget.imageUrl!,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget _fileImage() {
    return Image.file(
      _image!,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget _editImageIcon() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(47, 46, 43, 43),
        child: Center(
          child: IconButton(
            icon: const AssetImageView(fileName: AppIcons.editImageIcon),
            onPressed: _editImage,
          ),
        ));
  }

  Widget _addImageIcon() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_photo_alternate,
            color: Colors.grey,
            size: 32,
          ),
          Text("Add"),
        ],
      ),
    );
  }
}
