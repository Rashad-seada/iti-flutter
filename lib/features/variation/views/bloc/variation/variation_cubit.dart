import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/features/variation/views/screens/08_fabric_screen.dart';
import 'package:smart_soft/features/variation/views/screens/09_collar_screen.dart';
import 'package:smart_soft/features/variation/views/screens/11_chest_screen.dart';
import 'package:smart_soft/features/variation/views/screens/10_front_pocket_screen.dart';
import 'package:smart_soft/features/variation/views/screens/12_sleeve_screen.dart';
import 'package:smart_soft/features/variation/views/screens/13_button_screen.dart';
import 'package:smart_soft/features/variation/views/screens/14_embroidery_screen.dart';
import 'package:smart_soft/features/variation/views/screens/15_size_screen.dart';
import 'package:smart_soft/features/variation/views/screens/16_details_screen.dart';

import '../../screens/07_tailor_screen.dart';

part 'variation_state.dart';

class VariationCubit extends Cubit<VariationState> {
  VariationCubit() : super(VariationInitial());

  onTailorNextClick(BuildContext context){
    navigateToFabricScreen(context);
  }

  onFabricNextClick(BuildContext context){
    navigateToCollarScreen(context);
  }

  onCollarNextClick(BuildContext context){
    navigateToChestScreen(context);
  }

  onChestNextClick(BuildContext context){
    navigateToFrontPocketScreen(context);
  }

  onFrontPocketNextClick(BuildContext context){
    navigateToSleeveScreen(context);
  }

  onSleeveNextClick(BuildContext context){
    navigateToButtonScreen(context);
  }

  onButtonNextClick(BuildContext context){
    navigateToEmbroideryScreen(context);
  }

  onEmbroideryNextClick(BuildContext context){
    navigateToSizeScreen(context);
  }

  onSizeNextClick(BuildContext context){
    navigateToDetailsScreen(context);
  }

  onDetailsNextClick(BuildContext context){

  }

  navigateToCollarScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> CollarScreen()));
  }

  navigateToChestScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> ChestScreen()));
  }

  navigateToFrontPocketScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> FrontPocketScreen()));
  }

  navigateToSleeveScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> SleeveScreen()));
  }

  navigateToButtonScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> ButtonScreen()));
  }

  navigateToEmbroideryScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> EmbroideryScreen()));
  }

  navigateToTailorScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> TailorScreen()));
  }

  navigateToFabricScreen(BuildContext context) {
    Navigator.push(context,MaterialPageRoute(builder: (_)=> FabricScreen()));
  }

  navigateToSizeScreen(BuildContext context) {
    Navigator.push(context,MaterialPageRoute(builder: (_)=> SizeScreen()));
  }

  navigateToDetailsScreen(BuildContext context) {
    Navigator.push(context,MaterialPageRoute(builder: (_)=> DetailsScreen()));
  }

}
