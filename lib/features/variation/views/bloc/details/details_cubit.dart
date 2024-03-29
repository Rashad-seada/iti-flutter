import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/features/cart/views/blocs/cart/cart_cubit.dart';
import 'package:smart_soft/features/cart/views/screens/14_cart_screen.dart';
import 'package:smart_soft/generated/locale_keys.g.dart';

import '../../utils/design_model.dart';
import '../../utils/size_model.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());

  List<DesignModel> get designModels => [
    DesignModel(LocaleKeys.collar.tr(),"",""),
    DesignModel(LocaleKeys.chest.tr(),"",""),
    DesignModel(LocaleKeys.front_pocket.tr(),"",""),
    DesignModel(LocaleKeys.sleeve.tr(),"",""),
    DesignModel(LocaleKeys.button.tr(),"",""),
    DesignModel(LocaleKeys.embroidery.tr(),"",""),
  ];

  List<SizeModel> get sizeModels => [
    SizeModel(LocaleKeys.length.tr(),30),
    SizeModel(LocaleKeys.shoulder.tr(),30),
    SizeModel(LocaleKeys.sleeve.tr(),30),
    SizeModel(LocaleKeys.chest.tr(),30),
    SizeModel(LocaleKeys.neck.tr(),30),
    SizeModel(LocaleKeys.hand.tr(),30),
    SizeModel(LocaleKeys.cuff.tr(),30),

  ];

  onNextClick(BuildContext context) async {
    await context.read<CartCubit>().addToCart(context);
    Navigator.push(context,MaterialPageRoute(builder: (_)=> CartScreen(showContinueButton: true,)));
  }


}
