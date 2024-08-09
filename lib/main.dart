import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'core/bloc/core_cubit.dart';
import 'core/config/app_theme.dart';


import 'features/onboarding/view/bloc/on_boarding_cubit.dart';
import 'features/onboarding/view/screens/00_on_boarding_screen.dart';

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
