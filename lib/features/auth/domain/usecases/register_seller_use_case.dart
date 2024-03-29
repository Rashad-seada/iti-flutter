import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/features/auth/data/entities/register_seller_response.dart';
import 'package:smart_soft/features/auth/domain/repo/auth_repo.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/token_helper.dart';

class RegisterSellerUseCase {
  AuthRepo repo = getIt<AuthRepo>();

  Future<Either<Failure, RegisterSellerResponse>> call({
    required String username,
    required String phoneNumber,
    required String tradeRegister,
    required String taxId,
    required String password,
    required String locationId,
    required XFile registerImg,
  }) async {
      return await repo.registerSeller(
          username: username,
          phoneNumber: phoneNumber,
          tradeRegister: tradeRegister,
          taxId: taxId,
          password: password,
          locationId: locationId,
          registerImg: registerImg,
      ).then(
              (value) => value.fold(
                  (registerSellerError) {
                return left(registerSellerError);
              },
                  (registerSellerResponse) async {

                if(registerSellerResponse.obj?.token == null) {
                  return left(RemoteDataFailure("The token returned with null", failureCode: 4));
                }

                final user =  getIt<TokenHelper>().userFromToken(registerSellerResponse.obj!.token!);

                await getIt<AuthRepo>().setUser(user).then((value) => value.fold(
                        (userError) {
                      return left(userError);
                    },
                        (userSuccess) {

                    }
                )
                );

                return right(registerSellerResponse);

              }
          ));
  }
}
