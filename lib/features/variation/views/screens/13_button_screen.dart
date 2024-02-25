import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/views/widgets/custom_header.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../bloc/variation/variation_cubit.dart';
import '../components/button_card.dart';
import '../components/variant_card.dart';
import '../components/variant_nav_bar.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

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
            child: CustomHeader(title: LocaleKeys.button.tr(),),
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

          Space(
            height: 3.h,
          ),

          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            children: [

              ButtonCard(),

              ButtonCard(),

              ButtonCard(),

              ButtonCard(),


            ],
          ),


        ],
      ),

      bottomNavigationBar: VariantNavBar(
        onNextTap: () => context.read<VariationCubit>().onButtonNextClick(context),
      ),
    ));
  }
}
