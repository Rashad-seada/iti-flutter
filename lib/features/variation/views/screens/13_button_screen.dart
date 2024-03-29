import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/features/variation/views/bloc/button/button_cubit.dart';

import '../../../../core/config/app_consts.dart';
import '../../../../core/config/app_images.dart';
import '../../../../core/views/widgets/custom_header.dart';
import '../../../../core/views/widgets/custom_progress_indicator.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../bloc/variation/variation_cubit.dart';
import '../components/button_card.dart';
import '../components/variant_card.dart';
import '../components/variant_nav_bar.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {

  @override
  void initState() {
    context.read<ButtonCubit>().getButton(context);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ListView(
        shrinkWrap: true,

        children: [

          Space(
            height: 2.h,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.5.w),
            child: CustomHeader(title: LocaleKeys.button.tr(),),
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

          BlocConsumer<ButtonCubit,ButtonState>(
            listener: (context, state) {},
            builder: (context, state) {

              if(state is ButtonIsLoading){
              return CustomProgressIndicator();

              } else if(state is ButtonError){
              return Text(ButtonError.error.message);

              } else if(state is ButtonSuccess){
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                itemCount: ButtonSuccess.buttons.length,
                itemBuilder: (BuildContext context, int index) {
                  return ButtonCard(
                    title: ButtonSuccess.buttons[index].name ?? "Unknown",
                    imgUrl: AppConsts.imgUrl + ButtonSuccess.buttons[index].imgUrl.toString(),
                    price: ButtonSuccess.buttons[index].price ?? 0,
                    onTap: ()=> context.read<ButtonCubit>().onButtonTap(ButtonSuccess.buttons[index].id ?? -1, context),
                  );

                },
              );
              }

              return SizedBox();
            },
          ),



        ],
      ),

    ));
  }
}
