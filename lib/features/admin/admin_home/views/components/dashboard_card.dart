import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/views/widgets/space.dart';

import '../../../../../core/config/app_theme.dart';

class DashboardCard extends StatelessWidget {
  Color? color;
  String label;
  String count;
  String subText;
  void Function()? onTap;
  DashboardCard({super.key,this.color,required this.label,required this.count,required this.subText,this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
        width: 41.w,
        height: 41.w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4.w),
          boxShadow: [
            
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(
              label,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral100, fontSize: 14.sp),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  count,
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.neutral100, fontSize: 16.sp,fontWeight: FontWeight.w700),
                ),

                Space(height:0.3.h,),

                Text(
                  subText,
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.neutral100, fontSize: 8.sp),
                ),
              ],
            )





          ],
        ),
      ),
    );
  }
}
