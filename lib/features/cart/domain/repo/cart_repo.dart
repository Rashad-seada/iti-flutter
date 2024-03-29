import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/entities/cart_response.dart';

abstract class CartRepo {


  Future<Either<Failure, CartResponse>> getCart(String token);

  Future<Either<Failure, CartResponse>> addToCart({
    required String token,
    required String sellerId,

    required String length,
    required String shoulder,
    required String sleeves,
    required String chest,
    required String neck,
    required String hand,
    required String cuff,

    required String fabricId,
    required String collarId,
    required String chestId,
    required String frontPocketId,
    required String sleeveId,
    required String buttonId,
    required String embroideryId,
  });

  Future<Either<Failure, CartResponse>> removeFromCart({required String token,required String cartItemId});

  Future<Either<Failure, CartResponse>> updateCartItem({
    required String token,
    required String cartItemId,

    required String length,
    required String shoulder,
    required String sleeves,
    required String chest,
    required String neck,
    required String hand,
    required String cuff,

    required String fabricId,
    required String collarId,
    required String chestId,
    required String frontPocketId,
    required String sleeveId,
    required String buttonId,
    required String embroideryId,
  });

}