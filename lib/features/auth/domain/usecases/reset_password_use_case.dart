import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/features/auth/data/entities/register_customer_response.dart';
import 'package:smart_soft/features/auth/data/entities/register_seller_response.dart';
import 'package:smart_soft/features/auth/data/entities/reset_password_response.dart';
import 'package:smart_soft/features/auth/domain/repo/auth_repo.dart';

import '../../../../core/errors/failure.dart';

class ResetPasswordUseCase {

  AuthRepo repo = getIt<AuthRepo>();

  Future<Either<Failure, ResetPasswordResponse>> call( {required String newPassword, required String phoneNumber}) async {
    return await repo.resetPassword(newPassword: newPassword, phoneNumber: phoneNumber);
  }

}