import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_images.dart';
import 'package:smart_soft/core/views/widgets/space.dart';

import '../../../../../core/config/app_theme.dart';

class PendingSellerCard extends StatelessWidget {

  void Function()? onTap;
  PendingSellerCard({super.key,this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 2.h),
        padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
        decoration: BoxDecoration(
          color: AppTheme.green,
          borderRadius: BorderRadius.circular(4.w),
          boxShadow: [

          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Row(
              children: [
                
                SvgPicture.asset(AppImages.inbox,width: 5.w,height: 5.w,),
                
                Text(
                  "qqqqq",
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.neutral100, fontSize: 14.sp),
                ),
              ],
            ),

            Text(
              "qqq",
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral100, fontSize: 16.sp,fontWeight: FontWeight.w700),
            ),


            Text(
              "subText",
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral100, fontSize: 8.sp),
            ),

          ],
        ),
      ),
    );
  }
}
