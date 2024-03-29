part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartSuccess extends CartState {
  static CartResponse? cartResponse;

  CartSuccess(CartResponse? cartResponse) {
    CartSuccess.cartResponse = cartResponse;
  }
}

class CartError extends CartState {
  static Failure failure = Failure("", failureCode: 0);

  CartError(Failure failure ) {
    CartError.failure = failure;
  }
}

class CartIsLoading extends CartState {}
