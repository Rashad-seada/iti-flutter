import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/features/admin/admin_home/views/bloc/admin_home/admin_home_cubit.dart';
import 'package:smart_soft/features/auth/views/blocs/otp/otp_cubit.dart';
import 'package:smart_soft/features/auth/views/blocs/reset_password/reset_password_cubit.dart';
import 'package:smart_soft/features/cart/views/blocs/cart/cart_cubit.dart';
import 'package:smart_soft/features/home/views/bloc/home/home_cubit.dart';
import 'package:smart_soft/features/payment/views/blocs/payments/payments_cubit.dart';
import 'package:smart_soft/features/variation/views/bloc/details/details_cubit.dart';
import 'package:smart_soft/features/variation/views/bloc/size/size_cubit.dart';
import 'package:smart_soft/features/variation/views/bloc/variation/variation_cubit.dart';
import 'core/bloc/core_cubit.dart';
import 'core/config/app_theme.dart';
import 'features/auth/views/blocs/login/login_cubit.dart';
import 'features/auth/views/blocs/register/register_cubit.dart';

import 'features/onboarding/view/bloc/on_boarding_cubit.dart';
import 'features/onboarding/view/screens/00_on_boarding_screen.dart';
import 'features/seller/seller_home/views/blocs/seller_home/seller_home_cubit.dart';
import 'generated/codegen_loader.g.dart';

void main() async {

   await CoreCubit.setupApp();

   runApp(
   EasyLocalization(
       supportedLocales: const [Locale('en'), Locale('ar')],
       fallbackLocale: const Locale('en'),
       assetLoader: const CodegenLoader(),
       path: "assets/translations/",
       child: const MyApp())
   );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(create: (_) => CoreCubit()),
        BlocProvider(create: (_) => OnBoardingCubit()),
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => RegisterCubit()),
        BlocProvider(create: (_) => ResetPasswordCubit()),
        BlocProvider(create: (_) => OtpCubit()),
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) => VariationCubit()),
        BlocProvider(create: (_) => SizeCubit()),
        BlocProvider(create: (_) => DetailsCubit()),
        BlocProvider(create: (_) => PaymentsCubit()),
        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(create: (_) => SellerHomeCubit()),
        BlocProvider(create: (_) => AdminHomeCubit()),

      ],
      child: Sizer(
        builder: (BuildContext context, Orientation orientation,
            DeviceType deviceType) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            home: const OnBoardingScreen(),
            theme: AppTheme.theme(context),
          );
        },
      ),
    );
  }
}
