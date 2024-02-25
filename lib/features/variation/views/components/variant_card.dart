import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_theme.dart';
import 'package:smart_soft/core/views/widgets/custom_network_image.dart';
import 'package:smart_soft/core/views/widgets/space.dart';

class VariantCard extends StatelessWidget {
  bool isSelect;
  VariantCard({super.key,this.isSelect = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.w),
        border: Border.all(color: (isSelect)? AppTheme.primary900 : Colors.transparent,width: 1.5)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          CustomNetworkImage(
            url: '',
          ),
          Space(height: 1.5.h,),


          Text(
            "عادي",
            style: AppTheme.mainTextStyle(
                color: AppTheme.neutral900, fontSize: 10.sp),
          ),

        ],
      ),
    );
  }
}
