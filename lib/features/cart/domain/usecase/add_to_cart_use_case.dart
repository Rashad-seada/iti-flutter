import 'package:dartz/dartz.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/features/cart/data/entities/cart_response.dart';
import 'package:smart_soft/features/cart/domain/repo/cart_repo.dart';

import '../../../../core/errors/failure.dart';
import '../../../auth/domain/usecases/get_user_use_case.dart';

class AddToCartUseCase {
  CartRepo repo = getIt<CartRepo>();

  Future<Either<Failure, CartResponse>> call({
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
  }) async {


    return getIt<GetUserUseCase>().call().then(
            (value) =>
            value.fold(
                    (userError) {
                  return left(userError);
                },
                    (userSuccess) async {
                  if (userSuccess.token != null) {
                    return await repo.addToCart(
                        token: userSuccess.token!,
                        sellerId: sellerId,
                        length: length,
                        shoulder: shoulder,
                        sleeves: sleeves,
                        chest: chest,
                        neck: neck,
                        hand: hand,
                        cuff: cuff,
                        fabricId: fabricId,
                        collarId: collarId,
                        chestId: chestId,
                        frontPocketId: frontPocketId,
                        sleeveId: sleeveId,
                        buttonId: buttonId,
                        embroideryId: embroideryId);
                  }
                  return left(InternalFailure(
                      "token is equal to null", failureCode: 3));
                }

            ));


  }
}
