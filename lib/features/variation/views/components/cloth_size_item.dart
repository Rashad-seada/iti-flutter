import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/views/widgets/space.dart';

import '../../../../core/config/app_theme.dart';
import '../utils/size_model.dart';

class ClothSizeItem extends StatelessWidget {
  SizeModel sizeModel;

  ClothSizeItem({super.key, required this.sizeModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: .7.h),
      margin: EdgeInsets.only(bottom: 1.h),
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppTheme.neutral100,
          borderRadius: BorderRadius.circular(2.w),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(4, 4), // changes position of shadow
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(
            sizeModel.name,
            style: AppTheme.mainTextStyle(
                color: AppTheme.neutral900, fontSize: 11.sp),
          ),

          Row(
            children: [
              Text(
                sizeModel.value.toString(),
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral900, fontSize: 12.sp),
              ),

              Space(width: 2.w,),

              Text(
                "cm",
                style: AppTheme.mainTextStyle(
                    color: AppTheme.primary900, fontSize: 11.sp),
              ),

            ],
          )





        ],
      ),
    );
  }
}
