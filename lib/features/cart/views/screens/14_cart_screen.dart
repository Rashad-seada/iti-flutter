import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/views/widgets/custom_header.dart';
import 'package:smart_soft/core/views/widgets/space.dart';
import 'package:smart_soft/features/cart/views/blocs/cart/cart_cubit.dart';
import 'package:smart_soft/features/cart/views/components/cart_card.dart';

import '../../../../core/config/app_images.dart';
import '../../../../generated/locale_keys.g.dart';
import '../components/cart_nav_bar.dart';


class CartScreen extends StatelessWidget {
  bool showContinueButton;
  CartScreen({super.key,this.showContinueButton = false});

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
            child: CustomHeader(title: LocaleKeys.cart.tr(),showCart: false,),
          ),

          Space(
            height: 3.h,
          ),

          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            children: [

              CartCard(),

              CartCard(),

              CartCard(),

              CartCard(),


            ],
          ),



        ],
      ),
      bottomNavigationBar: CartNavBar(
        showContinueButton: showContinueButton,
        onCheckoutClick: ()=> context.read<CartCubit>().onCheckoutClick(context),
        onContinueShoppingClick: ()=> context.read<CartCubit>().onContinueShoppingClick(context),
      ),
    ));
  }
}
