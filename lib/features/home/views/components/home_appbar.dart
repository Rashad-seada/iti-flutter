import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../generated/locale_keys.g.dart';

class HomeAppBar extends StatelessWidget {
  String title;

  String trailingIcon;
  void Function()? onTrailingIconTap;
  String leadingIcon;
  void Function()? onLeadingIconTap;

  HomeAppBar({super.key,required this.title,required this.trailingIcon,required this.onTrailingIconTap,required this.leadingIcon,required this.onLeadingIconTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(100.w),
          onTap: onTrailingIconTap,
          child: SvgPicture.asset(
            trailingIcon,
            width: 8.w,
            height: 8.w,
          ),
        ),
        Text(
          title,
          style: AppTheme.mainTextStyle(
              color: AppTheme.neutral900, fontSize: 18.sp),
        ),

        InkWell(
          borderRadius: BorderRadius.circular(100.w),
          onTap: onLeadingIconTap,
          child: SvgPicture.asset(
            leadingIcon,
            width: 7.w,
            height: 7.w,
          ),
        ),
      ],
    );
  }
}
