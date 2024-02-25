import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/generated/locale_keys.g.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/space.dart';

class VariantNavBar extends StatelessWidget {
  void Function()? onNextTap;
  bool showPrevious;
  VariantNavBar({super.key,this.onNextTap,this.showPrevious = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.neutral100,
        boxShadow:  [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(4, 4), // changes position of shadow
          ),
        ]
      ),
      height: 10.h,

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //

          (showPrevious)?
          InkWell(
            onTap: ()=> Navigator.pop(context),
            child: Row(
              children: [
            
                Space(width: 2.w,),
                SvgPicture.asset(
                  AppImages.leftArrow,
                  width: 7.w,
                  height: 7.w,
                ),
                Space(width: 2.w,),

                Text(
                  LocaleKeys.previous,
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.primary900, fontSize: 15.sp),
                ).tr(),
            
            
              ],
            ),
          ) : SizedBox(),


          InkWell(
            onTap: onNextTap,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.next,
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.primary900, fontSize: 15.sp),
                ).tr(),

                Space(width: 2.w,),
                SvgPicture.asset(
                  AppImages.rightArrow,
                  width: 7.w,
                  height: 7.w,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
