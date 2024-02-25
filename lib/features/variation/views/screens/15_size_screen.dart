import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/features/variation/views/bloc/size/size_cubit.dart';
import 'package:smart_soft/features/variation/views/components/embroidery_card.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_header.dart';
import '../../../../core/views/widgets/custom_text_field.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../bloc/variation/variation_cubit.dart';
import '../components/variant_card.dart';
import '../components/variant_nav_bar.dart';

class SizeScreen extends StatelessWidget {
  const SizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: ListView(
          shrinkWrap: true,
          children: [

            Space(
              height: 2.h ,
            ),

            CustomHeader(title: LocaleKeys.cloth_size.tr(),),

            Space(
              height: 2.h,
            ),

            Text(
              LocaleKeys.length,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral400, fontSize: 12.sp),
            ).tr(),
            Space(
              height: 0.5.h,
            ),
            CustomTextField(
              keyboardType: TextInputType.number,
              controller: context.read<SizeCubit>().lengthController,
              validator: (_)=> context.read<SizeCubit>().validateField(_),

              prefixIcon: Padding(
                padding: EdgeInsets.all(3.w),
                child: Image.asset(
                  AppImages.length,
                  width: 3.w,
                  height: 3.h,
                ),

              ),
            ),

            Space(
              height: 1.h,
            ),

            Text(
              LocaleKeys.shoulder,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral400, fontSize: 12.sp),
            ).tr(),
            Space(
              height: 0.5.h,
            ),
            CustomTextField(
              keyboardType: TextInputType.number,
              controller: context.read<SizeCubit>().shoulderController,
              validator: (_)=> context.read<SizeCubit>().validateField(_),

              prefixIcon: Padding(
                padding: EdgeInsets.all(3.w),
                child: Image.asset(
                  AppImages.shoulder,
                  width: 3.w,
                  height: 3.h,
                ),

              ),
            ),

            Space(
              height: 1.h,
            ),

            Text(
              LocaleKeys.sleeve,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral400, fontSize: 12.sp),
            ).tr(),
            Space(
              height: 0.5.h,
            ),
            CustomTextField(
              keyboardType: TextInputType.number,
              controller: context.read<SizeCubit>().sleevesController,
              validator: (_)=> context.read<SizeCubit>().validateField(_),

              prefixIcon: Padding(
                padding: EdgeInsets.all(3.w),
                child: Image.asset(
                  AppImages.sleeve,
                  width: 3.w,
                  height: 3.h,
                ),

              ),
            ),

            Space(
              height: 1.h,
            ),

            Text(
              LocaleKeys.chest,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral400, fontSize: 12.sp),
            ).tr(),
            Space(
              height: 0.5.h,
            ),
            CustomTextField(
              keyboardType: TextInputType.number,
              controller: context.read<SizeCubit>().chestController,
              validator: (_)=> context.read<SizeCubit>().validateField(_),

              prefixIcon: Padding(
                padding: EdgeInsets.all(3.w),
                child: Image.asset(
                  AppImages.chest,
                  width: 3.w,
                  height: 3.h,
                ),

              ),
            ),

            Space(
              height: 1.h,
            ),

            Text(
              LocaleKeys.neck,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral400, fontSize: 12.sp),
            ).tr(),
            Space(
              height: 0.5.h,
            ),
            CustomTextField(
              keyboardType: TextInputType.number,
              controller: context.read<SizeCubit>().neckController,
              validator: (_)=> context.read<SizeCubit>().validateField(_),

              prefixIcon: Padding(
                padding: EdgeInsets.all(3.w),
                child: Image.asset(
                  AppImages.neck,
                  width: 3.w,
                  height: 3.h,
                ),

              ),
            ),

            Space(
              height: 1.h,
            ),

            Text(
              LocaleKeys.hand,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral400, fontSize: 12.sp),
            ).tr(),
            Space(
              height: 0.5.h,
            ),
            CustomTextField(
              keyboardType: TextInputType.number,
              controller: context.read<SizeCubit>().handController,
              validator: (_)=> context.read<SizeCubit>().validateField(_),

              prefixIcon: Padding(
                padding: EdgeInsets.all(3.w),
                child: Image.asset(
                  AppImages.hand,
                  width: 3.w,
                  height: 3.h,
                ),

              ),
            ),

            Space(
              height: 1.h,
            ),

            Text(
              LocaleKeys.cuff,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral400, fontSize: 12.sp),
            ).tr(),
            Space(
              height: 0.5.h,
            ),
            CustomTextField(
              keyboardType: TextInputType.number,
              controller: context.read<SizeCubit>().cuffController,
              validator: (_)=> context.read<SizeCubit>().validateField(_),

              prefixIcon: Padding(
                padding: EdgeInsets.all(3.w),
                child: Image.asset(
                  AppImages.cuff,
                  width: 3.w,
                  height: 3.h,
                ),

              ),
            ),

            Space(
              height: 1.h,
            ),

            Text(
              LocaleKeys.notes,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral400, fontSize: 12.sp),
            ).tr(),
            Space(
              height: 0.5.h,
            ),
            CustomTextField(
              controller: context.read<SizeCubit>().noteController,
              validator: (_)=> context.read<SizeCubit>().validateField(_),

              prefixIcon: Padding(
                padding: EdgeInsets.all(3.w),
                child: Image.asset(
                  AppImages.notes,
                  width: 3.w,
                  height: 3.h,
                ),

              ),
            ),

            Space(
              height: 5.h,
            ),

          ],
        ),
      ),

      bottomNavigationBar: VariantNavBar(
        onNextTap: () => context.read<VariationCubit>().onSizeNextClick(context),
      ),
    ));
  }
}
