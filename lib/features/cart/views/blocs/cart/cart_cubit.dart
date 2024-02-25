import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:smart_soft/features/home/views/screens/06_home_screen.dart';
import 'package:smart_soft/features/payment/views/screens/customer_details_screen.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  onCheckoutClick(BuildContext context){
    navigateToCustomerDetailsScreen(context);
  }

  onContinueShoppingClick(BuildContext context){
    navigateToHomeScreen(context);
  }

  navigateToCustomerDetailsScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> CustomerDetailsScreen()));
  }

  navigateToHomeScreen(BuildContext context){
    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (_)=> HomeScreen()), (route) => false);
  }



}
