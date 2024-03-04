import 'package:dartz/dartz.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/features/auth/data/entities/login_response.dart';
import 'package:smart_soft/features/auth/data/entities/user_entity.dart';
import 'package:smart_soft/features/auth/domain/model/user_model.dart';
import 'package:smart_soft/features/auth/domain/repo/auth_repo.dart';

import '../../../../core/errors/failure.dart';

class UpdateUserUseCase {

  AuthRepo repo = getIt<AuthRepo>();

  Future<Either<Failure, UserEntity>> call(UserEntity updatedUser) async {
    return await repo.updateUser(updatedUser);
  }

}