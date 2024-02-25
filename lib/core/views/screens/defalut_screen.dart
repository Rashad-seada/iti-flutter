import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/views/widgets/custom_header.dart';
import 'package:smart_soft/core/views/widgets/space.dart';

import '../../../generated/locale_keys.g.dart';
import '../../config/app_images.dart';


class DefaultScreen extends StatelessWidget {
  const DefaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [

          Space(
            height: 2.h ,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.5.w),
            child: CustomHeader(title: LocaleKeys.collar.tr(),),
          ),

          Space(
            height: 3.h,
          ),

          SvgPicture.asset(
            fit: BoxFit.fitWidth,
            AppImages.cloth,
            width: 100.w,
            height: 38.h,
          ),

        ],
      ),
    ));
  }
}
