import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/app/core/values/app_colors.dart';
import 'package:e_commerce/app/core/values/app_icons.dart';
import 'package:e_commerce/app/module/home/widget/image/asset_Image_view.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CachedImage extends StatelessWidget {
  CachedImage(
      {super.key, this.imageHeight, this.imageWidth, required this.image});

  String image;
  double? imageHeight;
  double? imageWidth;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      height: imageHeight,
      width: imageWidth,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          const LinearProgressIndicator(
        backgroundColor: AppColors.primaryGreen02,
        valueColor: AlwaysStoppedAnimation(AppColors.primaryGreen01),
        minHeight: 20,
      ),
      errorWidget: (context, url, error) => AssetImageView(
        fileName: AppIcons.placeholder,
        height: 48.h,
        width: 48.h,
      ),
      fit: BoxFit.fill,
    );
  }
}
