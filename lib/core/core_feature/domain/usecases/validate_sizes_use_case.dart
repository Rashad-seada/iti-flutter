import 'package:regexpattern/regexpattern.dart';

class ValidateSizesUseCase {

  String? call(String text){
    if(text.trim().isEmpty){
      return "Please enter your phone number";
    } else if(double.tryParse(text) == null) {
      return "Please enter a numbers only";
    } else {
       return null;
    }
  }

}