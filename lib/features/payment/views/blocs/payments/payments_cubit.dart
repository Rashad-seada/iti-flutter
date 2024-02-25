import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/core/usecases/validate_phone_use_case.dart';
import 'package:smart_soft/features/home/views/screens/06_home_screen.dart';
import 'package:smart_soft/features/payment/views/screens/payment_message_screen.dart';
import 'package:smart_soft/features/payment/views/screens/payment_methods_screen.dart';

part 'payments_state.dart';

class PaymentsCubit extends Cubit<PaymentsState> {
  PaymentsCubit() : super(PaymentsInitial());

  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? validateUsername(){
    if(usernameController.text.trim().isEmpty){
      return "please enter your name";
    }
  }

  validatePhone(){
    return getIt<ValidatePhoneUseCase>().call(phoneNumberController.text);
  }

  onCustomerDetailsNextClick(BuildContext context) {
    _navigateToPaymentMethodsScreen(context);
  }

  onPaymentConfirmClick(BuildContext context) {
    _navigateToPaymentMessageScreen(context);
  }

  onPaymentMessageDoneClick(BuildContext context){
    _navigateToHomeScreen(context);
  }



  _navigateToPaymentMethodsScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=>  PaymentMethodsScreen()) );
  }

  _navigateToPaymentMessageScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=>  PaymentMessageScreen()) );
  }

  _navigateToHomeScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=>  HomeScreen()) );
  }

}
