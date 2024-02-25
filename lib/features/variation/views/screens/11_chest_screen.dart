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
import '../components/variant_card.dart';
import '../components/variant_nav_bar.dart';

class ChestScreen extends StatelessWidget {
  const ChestScreen({super.key});

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
            child: CustomHeader(title: LocaleKeys.chest.tr(),),
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

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Number of columns
              crossAxisSpacing: 3.w, // Spacing between columns
              mainAxisSpacing: 3.w, // Spacing between rows
            ),
            //padding: EdgeInsets.all(10.0), // Padding around the GridView
            itemCount: 6, // Number of items
            itemBuilder: (BuildContext context, int index) {
              // Function that returns a widget for each item
              return VariantCard(isSelect: index == 0,);
            },
          ),


        ],
      ),

      bottomNavigationBar: VariantNavBar(
        onNextTap: () => context.read<VariationCubit>().onChestNextClick(context),
      ),
    ));
  }
}
