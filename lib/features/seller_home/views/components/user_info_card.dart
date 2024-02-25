import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_theme.dart';
import 'package:smart_soft/core/views/widgets/space.dart';
import 'package:smart_soft/features/seller_home/views/components/user_info_item.dart';
import 'package:smart_soft/features/seller_home/views/utils/user_info_model.dart';
import 'package:smart_soft/features/variation/views/utils/design_model.dart';
import 'package:smart_soft/generated/locale_keys.g.dart';

import '../../../variation/views/components/cloth_design_item.dart';



class UserInfoCard extends StatelessWidget {
  List<UserInfoModel> designModels;
  UserInfoCard({super.key,this.designModels = const []});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 3.w,right: 3.w, top: 3.w),
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppTheme.neutral200,
          borderRadius: BorderRadius.circular(2.w),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(4, 4), // changes position of shadow
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            LocaleKeys.cloth_design,
            style: AppTheme.mainTextStyle(
                color: AppTheme.neutral900, fontSize: 12.sp),
          ).tr(),

          Space(height: 1.h,),
          
          Column(
            children: List.generate(designModels.length, (index) => UserInfoItem(designModel:designModels[index])),
          )



        ],
      ),
    );
  }
}
