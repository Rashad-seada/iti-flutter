import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/features/variation/views/components/cloth_design_card.dart';
import 'package:smart_soft/features/variation/views/components/cloth_size_card.dart';
import 'package:smart_soft/features/variation/views/components/embroidery_card.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/views/widgets/custom_header.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../bloc/details/details_cubit.dart';
import '../bloc/variation/variation_cubit.dart';
import '../components/variant_card.dart';
import '../components/variant_nav_bar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.5.w),
        child: ListView(
          shrinkWrap: true,

          children: [

            Space(
              height: 2.h ,
            ),

            CustomHeader(title: LocaleKeys.cloth_details.tr(),),

            Space(
              height: 3.h,
            ),

            SvgPicture.asset(
              fit: BoxFit.fitWidth,
              AppImages.cloth,
              width: 100.w,
              height: 38.h,
            ),


            ClothDesignCard(designModels: context.read<DetailsCubit>().designModels,),

            Space(
              height: 2.h,
            ),

            ClothSizeCard(sizeModels: context.read<DetailsCubit>().sizeModels,),

            Space(
              height: 2.h,
            ),

          ],
        ),
      ),

      bottomNavigationBar: VariantNavBar(
        onNextTap: () => context.read<DetailsCubit>().onNextClick(context),
      ),
    ));
  }
}
