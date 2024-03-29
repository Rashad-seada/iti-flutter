part of 'button_cubit.dart';

@immutable
abstract class ButtonState {}

class ButtonInitial extends ButtonState {}

class ButtonSuccess extends ButtonState {

  static List<ButtonEntity> buttons = [];

  ButtonSuccess(List<ButtonEntity> buttons){
    ButtonSuccess.buttons = buttons;
  }

}

class ButtonError extends ButtonState {
  static Failure error = Failure("", failureCode: 0);

  ButtonError(Failure error){
    ButtonError.error = error;
  }
}

class ButtonIsLoading extends ButtonState {}