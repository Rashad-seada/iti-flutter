import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';

class QuantityComponent extends StatefulWidget {
  int quantity;
  void Function(int)? onTap;
  QuantityComponent({super.key,this.quantity = 1,this.onTap});

  @override
  State<QuantityComponent> createState() => _QuantityComponentState();
}

class _QuantityComponentState extends State<QuantityComponent> {


  _increase(){
    setState(() {
      widget.quantity += 1;
    });
  }

  _decrease(){
    setState(() {
      if(!(widget.quantity <= 1)){
        widget.quantity -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      alignment: Alignment.center,
      width: 25.w,
      height: 4.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100.w),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(4, 4), // changes position of shadow
            ),
          ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          InkWell(
            onTap: (){
              _decrease();
              if(widget.onTap != null){
                widget.onTap!(widget.quantity);
              }
            },
            child: Expanded(
              child: Text(
                "-",
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral900, fontSize: 13.sp),
              ),
            ),
          ),

          Text(
            widget.quantity.toString(),
            style: AppTheme.mainTextStyle(
                color: AppTheme.neutral900, fontSize: 13.sp),
          ),


          InkWell(
            onTap: (){
              _increase();
              if(widget.onTap != null){
                widget.onTap!(widget.quantity);
              }
            },
            child: Expanded(
              child: Text(
                "+",
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral900, fontSize: 13.sp),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
