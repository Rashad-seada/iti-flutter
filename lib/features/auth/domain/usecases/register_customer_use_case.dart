import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/features/auth/data/entities/register_customer_response.dart';
import 'package:smart_soft/features/auth/data/entities/register_seller_response.dart';
import 'package:smart_soft/features/auth/domain/repo/auth_repo.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/token_helper.dart';

class RegisterCustomerUseCase {

  AuthRepo repo = getIt<AuthRepo>();

  Future<Either<Failure, RegisterCustomerResponse>> call( {required String username,
    required String phoneNumber,
    required String password}) async {
    return await repo.registerCustomer(username: username, phoneNumber: phoneNumber, password: password).then(
            (value) => value.fold(
                (registerCustomerError) {
              return left(registerCustomerError);
            },
                (registerCustomerResponse) async {

              if(registerCustomerResponse.obj?.token == null) {
                return left(RemoteDataFailure("The token returned with null", failureCode: 4));
              }

              final user =  getIt<TokenHelper>().userFromToken(registerCustomerResponse.obj!.token!);

              await getIt<AuthRepo>().setUser(user).then((value) => value.fold(
                  (userError) {
                    return left(userError);
                  },
                  (userSuccess) {

                  }
              )
              );

              return right(registerCustomerResponse);

            }
        ));
  }

}