import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/core/errors/failure.dart';
import 'package:smart_soft/features/cart/views/screens/14_cart_screen.dart';
import 'package:smart_soft/features/home/data/entities/get_home_response.dart';
import 'package:smart_soft/features/home/domain/usecases/get_home_ads_use_case.dart';
import 'package:smart_soft/features/variation/views/screens/07_tailor_screen.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  getHomeAds(){
    emit(HomeIsLoading());
    getIt<GetHomeAdsUseCase>().call().then((value) => value.fold(
            (error) {
              emit(HomeError(error));
            },
            (success) {
              emit(HomeSuccess(success));
            }
    ));
  }


  navigateToVariation(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> const TailorScreen()));
  }

  navigateToCartScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> CartScreen(
      showContinueButton: false,
    )));
  }
  // getHome(){
  //   emit(HomeIsLoading());
  //   getIt<>
  // }
}
