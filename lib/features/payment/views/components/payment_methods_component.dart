import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/views/widgets/custom_radio.dart';

import '../../../../core/config/app_theme.dart';

class PaymentMethodsComponent extends StatelessWidget {
  String title;
  String value;
  String groupValue;
  void Function(String?)? onChanged;

  PaymentMethodsComponent({super.key,required this.title,required this.value,required this.groupValue,this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        CustomRadio(value: value, groupValue: groupValue,onChanged: onChanged,),

        Text(
          title,
          style: AppTheme.mainTextStyle(
              color: AppTheme.neutral900, fontSize: 18.sp),
        ),
      ],
    );
  }
}
