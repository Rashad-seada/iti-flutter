import 'package:flutter/material.dart';
import 'package:smart_soft/core/config/app_theme.dart';

class CustomRadio extends StatelessWidget {
  String value;
  String groupValue;
  void Function(String?)? onChanged;

  CustomRadio({super.key,required this.value,required this.groupValue,this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Radio<String>(
      activeColor: AppTheme.primary900,

      value: value, groupValue: groupValue, onChanged: onChanged,);
  }


}
