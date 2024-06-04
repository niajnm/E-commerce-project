import 'dart:developer';
import 'package:e_commerce/app/core/values/text_style.dart';
import 'package:e_commerce/app/module/home/widget/image/asset_Image_view.dart';
import 'package:flutter/material.dart';

class NetworkImageWithErrorHandler extends StatelessWidget {
  final String? imageUrl;
  final String defaultImagePath;
  final double radius;
  final double imageSize;

  const NetworkImageWithErrorHandler({
    super.key,
    this.imageUrl,
    required this.defaultImagePath,
    this.radius = 30.0,
    this.imageSize = 50,
  });

  @override
  Widget build(BuildContext context) {
    return _getImage(context);
  }

  Widget _getImage(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tight(Size(imageSize, imageSize)),
      decoration: _boxDecoration(),
      child: _getClipRect(),
    );
  }

  Widget _getClipRect() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        imageUrl ?? 'ops',
        errorBuilder: _handleImageError,
        fit: BoxFit.fill,
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: Colors.white,
        width: 2.0,
      ),
    );
  }

  Widget _handleImageError(
      BuildContext context, Object exception, StackTrace? stackTrace) {
    return _defaultImage();
  }

  Widget _defaultImage() {
    return _isDefaultImage()
        ? AssetImageView(
            fileName: defaultImagePath,
            fit: BoxFit.contain,
          )
        : _nameAsaImage();
  }

  bool _isDefaultImage() {
    return (defaultImagePath.endsWith('.jpg') ||
        defaultImagePath.endsWith('.png'));
  }

  Widget _imageText(String name) {
    return Text(
      name,
      style: titleStyle,
    );
  }

  Widget _nameAsaImage() {
    return CircleAvatar(
      backgroundColor: Colors.blue,
      radius: 25,
      child: _imageText(defaultImagePath),
    );
  }
}
