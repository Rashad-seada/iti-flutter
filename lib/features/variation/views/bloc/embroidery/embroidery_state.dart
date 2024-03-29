part of 'embroidery_cubit.dart';

@immutable
abstract class EmbroideryState {}

class EmbroideryInitial extends EmbroideryState {}


class EmbroiderySuccess extends EmbroideryState {

  static List<EmbroideryEntity> embroiderys = [];

  EmbroiderySuccess(List<EmbroideryEntity> embroidery){
    EmbroiderySuccess.embroiderys = embroidery;
  }

}


class EmbroideryError extends EmbroideryState {
  static Failure error = Failure("", failureCode: 0);

  EmbroideryError(Failure error){
    EmbroideryError.error = error;
  }
}

class EmbroideryIsLoading extends EmbroideryState {}