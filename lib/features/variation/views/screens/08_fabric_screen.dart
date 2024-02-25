import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/views/widgets/custom_header.dart';
import 'package:smart_soft/features/variation/views/bloc/variation/variation_cubit.dart';
import 'package:smart_soft/features/variation/views/components/variant_nav_bar.dart';
import 'package:smart_soft/generated/locale_keys.g.dart';

import '../../../../core/views/widgets/space.dart';
import '../components/fabric_card.dart';

class FabricScreen extends StatelessWidget {
  const FabricScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: [

            Space(
              height: 2.h,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.5.w),
              child: CustomHeader(title: LocaleKeys.fabric.tr(),),
            ),


            Space(
              height: 3.h,
            ),


            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: const [
                FabricCard(),

                FabricCard(),

                FabricCard(),

                FabricCard(),

                FabricCard(),
              ],
            ),

            Space(
              height: 3.h,
            ),

          ],
        ),
        
        bottomNavigationBar: VariantNavBar(
          onNextTap: () => context.read<VariationCubit>().onFabricNextClick(context),
        ),

      ),
    );
  }
}
