part of 'fabric_cubit.dart';

@immutable
abstract class FabricState {}

class FabricInitial extends FabricState {}

class FabricSuccess extends FabricState {

  static List<FabricEntity> fabrics = [];

  FabricSuccess(List<FabricEntity> fabrics){
    FabricSuccess.fabrics = fabrics;
  }

}


class FabricError extends FabricState {
  static Failure error = Failure("", failureCode: 0);

  FabricError(Failure error){
    FabricError.error = error;
  }
}

class FabricIsLoading extends FabricState {}
