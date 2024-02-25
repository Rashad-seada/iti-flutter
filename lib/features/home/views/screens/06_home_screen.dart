import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_images.dart';
import 'package:smart_soft/features/home/views/components/home_card.dart';

import '../../../../core/views/widgets/custom_page_indicator.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../components/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Space(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.5.w),
              child: HomeAppBar(
                title: LocaleKeys.home.tr(),
                trailingIcon: AppImages.menu,
                onTrailingIconTap: () {},
                leadingIcon: AppImages.cart,
                onLeadingIconTap: () {},
              ),
            ),
            Space(
              height: 1.h,
            ),
            SizedBox(
              height: 80.h,
              child: PageView(
                padEnds: true,
                children: const [
                  HomeCard(),
                  HomeCard(),
                  HomeCard(),
                ],
              ),
            ),
            Space(
              height: 2.h,
            ),
            Center(
              child: CustomPageIndicator(
                count: 5,
                index: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
