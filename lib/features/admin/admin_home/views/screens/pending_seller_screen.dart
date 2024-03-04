import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/config/app_theme.dart';
import '../../../../../core/views/widgets/custom_back_button.dart';
import '../../../../../core/views/widgets/space.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../components/pending_seller_card.dart';

class PendingSellerScreen extends StatelessWidget {
  const PendingSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        children: [

          Space(
            height: 2.h,
          ),
          CustomBackButton(),

          Space(
            height: 3.h,
          ),

          Text(
            LocaleKeys.pending_seller,
            style: AppTheme.mainTextStyle(
              color: AppTheme.neutral900,
              fontSize: 20.sp,
            ),
          ).tr(),

          Space(
            height: 2.h,
          ),

          ListView(
            shrinkWrap: true,
            children: [

              PendingSellerCard(),

              PendingSellerCard(),

              PendingSellerCard(),

            ],)
        ],
      ),
    ));
  }
}
