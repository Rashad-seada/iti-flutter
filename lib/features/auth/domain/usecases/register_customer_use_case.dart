import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/features/auth/data/entities/register_customer_response.dart';
import 'package:smart_soft/features/auth/data/entities/register_seller_response.dart';
import 'package:smart_soft/features/auth/domain/repo/auth_repo.dart';

import '../../../../core/errors/failure.dart';

class RegisterCustomerUseCase {

  AuthRepo repo = getIt<AuthRepo>();

  Future<Either<Failure, RegisterCustomerResponse>> call( {required String username,
    required String phoneNumber,
    required String password}) async {
    return await repo.registerCustomer(username: username, phoneNumber: phoneNumber, password: password);
  }

}