import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../features/cart/views/screens/14_cart_screen.dart';
import '../../config/app_images.dart';
import '../../config/app_theme.dart';

class CustomHeader extends StatelessWidget {
  String title;
  bool showCart;
  CustomHeader({super.key,this.title = "Title",this.showCart = true});

  pop(BuildContext context){
    Navigator.pop(context);
  }

  navigateToCart(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> CartScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(100.w),
          onTap: () {
            pop(context);
          },
          child: SvgPicture.asset(
            AppImages.arrow,
            width: 7.w,
            height: 7.w,
          ),
        ),
        Text(
          title,
          style: AppTheme.mainTextStyle(
              color: AppTheme.neutral900, fontSize: 18.sp),
        ),

        (showCart)?

        InkWell(
          borderRadius: BorderRadius.circular(100.w),
          onTap: () {
            navigateToCart(context);
          },
          child: SvgPicture.asset(
            AppImages.cart,
            width: 7.w,
            height: 7.w,
          ),
        ) : SizedBox(width: 7.w,),
      ],
    );
  }
}
