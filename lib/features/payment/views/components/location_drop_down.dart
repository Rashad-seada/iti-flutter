import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';

class LocationDropDown extends StatelessWidget {
  double? width;
  double? height;
  void Function()? onTap;
  LocationDropDown({super.key,this.height,this.width,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.w),
        border: Border.all(color: AppTheme.neutral300,width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          style: AppTheme.mainTextStyle(
              color: AppTheme.neutral400, fontSize: 12.sp),
          value: "Option 1",
          onChanged: (String? newValue) {
        
          },
          items: <String>['Option 1', 'Option 2', 'Option 3']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),

    );
  }
}
