part of 'variation_cubit.dart';

@immutable
abstract class VariationState {}

class VariationInitial extends VariationState {}

class VariationSuccess extends VariationState {

  static List<SellerEntity> sellers = [];

  VariationSuccess(List<SellerEntity> sellers){
    VariationSuccess.sellers = sellers;
  }

}


class VariationError extends VariationState {
  static Failure error = Failure("", failureCode: 0);

  VariationError(Failure error){
    VariationError.error = error;
  }

}

class VariationIsLoading extends VariationState {}
