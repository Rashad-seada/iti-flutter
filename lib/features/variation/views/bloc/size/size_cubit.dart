import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/core/usecases/validate_text_use_case.dart';

part 'size_state.dart';

class SizeCubit extends Cubit<SizeState> {
  SizeCubit() : super(SizeInitial());

  TextEditingController lengthController = TextEditingController();
  TextEditingController shoulderController = TextEditingController();
  TextEditingController sleevesController = TextEditingController();
  TextEditingController chestController = TextEditingController();
  TextEditingController neckController = TextEditingController();
  TextEditingController handController = TextEditingController();
  TextEditingController cuffController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  validateField(text){
    getIt<ValidateTextUseCase>().call(text);
  }



}
