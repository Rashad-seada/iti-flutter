import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/features/variation/views/screens/07_tailor_screen.dart';
import 'package:smart_soft/features/variation/views/screens/08_fabric_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());


  navigateToVariation(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> const TailorScreen()));
  }
}
