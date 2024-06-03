import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormLabel extends StatelessWidget {
  final String labelText;
  final bool isRequired;

  const FormLabel(this.labelText, this.isRequired, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8).r,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Text(
              labelText,
              //  style: context.resources.styles.bodyText1()
            ),
            isRequired
                ? const Text(
                    '*',
                    // style: context.resources.styles
                    //     .bodyText1(context.resources.colors.error600)
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
