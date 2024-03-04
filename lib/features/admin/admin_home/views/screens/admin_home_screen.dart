import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_theme.dart';
import 'package:smart_soft/features/admin/admin_home/views/bloc/admin_home/admin_home_cubit.dart';

import '../../../../../core/config/app_images.dart';
import '../../../../../core/views/widgets/space.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../home/views/components/home_appbar.dart';
import '../components/admin_drawer.dart';
import '../components/dashboard_card.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: context.read<AdminHomeCubit>().scaffoldKey,
      drawer: AdminDrawer(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        children: [
          Space(
            height: 2.h,
          ),
          HomeAppBar(
            title: LocaleKeys.dashboard.tr(),
            trailingIcon: AppImages.menu,
            onTrailingIconTap: () =>
                context.read<AdminHomeCubit>().openDrawer(),
            leadingIcon: "",
            onLeadingIconTap: () {},
          ),
          Space(
            height: 3.h,
          ),
          Text(
            "WELCOME BACK",
            style: AppTheme.mainTextStyle(
                color: AppTheme.neutral500, fontSize: 10.sp),
          ),
          Text(
            "Rashad Seada",
            style: AppTheme.mainTextStyle(
                color: AppTheme.neutral900, fontSize: 20.sp),
          ),
          Space(
            height: 3.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DashboardCard(
                color: AppTheme.green,
                label: 'Pending seller request',
                count: '23',
                subText: 'this is a sub text',
                onTap: () => context.read<AdminHomeCubit>().onPendingSellerRequestClick(context),
              ),
              DashboardCard(
                color: AppTheme.red,
                label: 'New user',
                count: '1325',
                subText: 'this is a sub text',
              ),
            ],
          ),
          Space(
            height: 2.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DashboardCard(
                color: AppTheme.yellow,
                label: 'Monthly income',
                count: '23,100 \$',
                subText: 'this is a sub text',
              ),
              DashboardCard(
                color: AppTheme.blue,
                label: 'New seller',
                count: '123',
                subText: 'this is a sub text',
              ),
            ],
          )
        ],
      ),
    ));
  }
}
