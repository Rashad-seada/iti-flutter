import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_theme.dart';

import '../../../../core/views/widgets/space.dart';

class OnBoardingPage extends StatelessWidget {
  String image;
  String title;

  OnBoardingPage({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(

      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.center,

        children: [

          Space(
            height: 10.h,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                title,
                style: TextStyle(color: AppTheme.neutral900,fontSize: 14.sp,fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ).tr(),
            ),
          ),
          Space(
            height: 8.h,
          ),
          Center(
            child: Center(
                child: SvgPicture.asset(
                  fit: BoxFit.cover,
                  image,
                  width: 100.w,
                  height: 45.h,
                )),
          ),


        ]);
  }
}
