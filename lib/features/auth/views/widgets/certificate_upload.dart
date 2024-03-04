import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_theme.dart';
import 'package:smart_soft/core/views/widgets/space.dart';

import '../../../../core/config/app_images.dart';
import '../../../../generated/locale_keys.g.dart';

class CertificateUpload extends StatelessWidget {
  XFile? file;
  double? width;
  double? height;
  void Function()? onTap;
  CertificateUpload ({this.file,super.key,this.width,this.height,this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.neutral300 ,width: 1)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SvgPicture.asset(
              AppImages.upload,
              width: 3.w,
              height: 3.h,
            ),

            Space(width: 3.w,),

            Expanded(
              child: Text(
                file?.name ?? LocaleKeys.upload.tr(),
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral600, fontSize: 12.sp),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ).tr(),
            ),

          ],
        ),

      ),
    );
  }
}
