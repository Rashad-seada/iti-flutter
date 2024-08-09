import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/views/widgets/space.dart';
import 'package:smart_soft/features/onboarding/view/bloc/on_boarding_cubit.dart';
import 'package:smart_soft/generated/locale_keys.g.dart';
import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_page_indicator.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../pages/on_boarding_page.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [

            SizedBox(
              child: PageView(
                controller: context.read<OnBoardingCubit>().controller,
                onPageChanged: context.read<OnBoardingCubit>().onPageChanged,
                children: [

                  OnBoardingPage(
                    image: AppImages.onBoardingImage2,
                    title: "Browse & Order All Products at Any Time",
                  ),

                  OnBoardingPage(
                    image: AppImages.onBoardingImage1,
                    title: "Your Packages in Our Safe Hands",
                  ),

                  OnBoardingPage(
                    image: AppImages.onBoardingImage3,
                    title: "Committed Delivery on Time",
                  ),

                  OnBoardingPage(
                    image: AppImages.onBoardingImage4,
                    title: "7/24 \n Fastest & Safest Delivery",
                  ),

                ],
              ),
            ),



            Positioned(
              bottom: 10.h,
              child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      CustomPageIndicator(
                        index: context.read<OnBoardingCubit>().index,
                      ),

                      Space(height: 2.h,),

                      SizedBox(
                        width : 86.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Text(
                              LocaleKeys.skip,
                              style: AppTheme.mainTextStyle(
                                  color: AppTheme.neutral700, fontSize: 12.sp,fontWeight: FontWeight.bold),
                            ).tr(),

                            MainButton(
                              color: AppTheme.primary900,
                              width: 35.w,
                              height: 5.h,
                              label: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 7.w),
                                child: Row(
                                  children: [
                                    Text(
                                      LocaleKeys.next,
                                      style: AppTheme.mainTextStyle(
                                          color: AppTheme.neutral100, fontSize: 12.sp,fontWeight: FontWeight.bold),
                                    ).tr(),
                                  ],
                                ),
                              ),
                              onTap: ()=> context.read<OnBoardingCubit>().onNextClick(context),
                            ),


                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
