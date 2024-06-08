import 'package:e_commerce/app/core/values/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterBar extends StatelessWidget {
  final Function() onFilterTap;
  final Function(String?) onSortChange;
  final String selectedSort;

  FilterBar({
    required this.onFilterTap,
    required this.onSortChange,
    required this.selectedSort,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72.h,
      //color: Colors.white,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onFilterTap,
                child: Row(
                  children: [
                    const Icon(
                      Icons.filter_list,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Filter',
                      style: context.appThemeText.bodyMedium,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    'Sort by',
                    style: context.appThemeText.bodyMedium,
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_drop_down),
                  const SizedBox(width: 8),
                  const Icon(Icons.view_list),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
