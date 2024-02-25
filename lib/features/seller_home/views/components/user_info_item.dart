import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/views/widgets/custom_network_image.dart';
import 'package:smart_soft/core/views/widgets/space.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../utils/user_info_model.dart';

class UserInfoItem extends StatelessWidget {
  UserInfoModel designModel;

  UserInfoItem({super.key, required this.designModel});

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Padding(
            padding: EdgeInsets.all(1.w),
            child: SvgPicture.asset(
              designModel.icon,
              width: 5.w,
              height: 5.w,
            ),
          ),

          Space(width: 2.w,),

          Text(
            designModel.label,
            style: AppTheme.mainTextStyle(
                color: AppTheme.neutral900, fontSize: 11.sp),
          ),

        ],
      ),
    );
  }
}
