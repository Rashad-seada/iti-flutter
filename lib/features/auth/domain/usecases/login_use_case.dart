import 'package:dartz/dartz.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/core/utils/token_helper.dart';
import 'package:smart_soft/features/auth/data/entities/login_response.dart';
import 'package:smart_soft/features/auth/domain/repo/auth_repo.dart';

import '../../../../core/errors/failure.dart';

class LoginUseCase {

  AuthRepo repo = getIt<AuthRepo>();

  Future<Either<Failure, LoginResponse>> call(String phoneNumber,String password) async {
    return await repo.login(phoneNumber: phoneNumber, password: password).then(
            (value) => value.fold(
                    (loginError) {
                      return left(loginError);
                    },
                    (loginResponse) async {

                      if(loginResponse.obj?.token == null) {
                        return left(RemoteDataFailure("The token returned with null", failureCode: 4));
                      }

                      final user = getIt<TokenHelper>().userFromToken(loginResponse.obj!.token!);

                      await getIt<AuthRepo>().setUser(user).then((value) => value.fold(
                              (userError) {
                                return left(userError);
                              },
                              (userSuccess) {

                              }
                        )
                      );

                      return right(loginResponse);

                    }
            ));
  }

}