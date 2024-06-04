import 'package:e_commerce/app/core/values/text_style.dart';
import 'package:e_commerce/app/module/home/widget/image/cached_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridCard extends StatelessWidget {
  const GridCard({
    super.key,
    required this.image,
    this.imageHeight,
    this.imageWeight,
    required this.title,
    required this.onTap,
    this.subTitle,
  });

  final String image;
  final double? imageHeight;
  final double? imageWeight;
  final String title;
  final String? subTitle;

  /// OnTap function will return the value
  /// That you will use in later
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_image(), _titleAndSubTitle(context)],
      ),
    );
  }

  Widget _image() {
    return SizedBox(
      height: imageHeight,
      width: imageWeight,
      child: CachedImage(
        image: image,
      ),
    );
  }

  Widget _titleAndSubTitle(context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(context),
            _subTitle(),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }

  Widget _title(context) {
    return Text(title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleSmall);
  }

  Widget _subTitle() {
    return subTitle != null
        ? Text(subTitle!, maxLines: 2, style: twoLinesTextItemSubtitleTextStyle)
        : const SizedBox.shrink();
  }
}
