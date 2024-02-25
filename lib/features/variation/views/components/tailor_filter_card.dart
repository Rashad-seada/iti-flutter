import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_theme.dart';
import 'package:smart_soft/core/views/widgets/space.dart';
import 'package:smart_soft/generated/locale_keys.g.dart';

import '../../../../core/config/app_images.dart';

class TailorFilterCard extends StatelessWidget {
  void Function()? onTap;
  bool isSelect;
  TailorFilterCard({super.key,this.isSelect = true,this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          SvgPicture.asset(
            AppImages.filter,
            width: 7.w,
            height: 7.w,
          ),

          Space(width: 1.5.h,),

          Text(
            LocaleKeys.filter_by_city,
            style: AppTheme.mainTextStyle(
                color: AppTheme.neutral900, fontSize: 10.sp),
          ).tr(),

        ],
      ),
    );
  }
}
