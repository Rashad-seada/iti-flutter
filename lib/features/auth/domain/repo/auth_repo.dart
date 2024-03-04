import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_soft/core/errors/failure.dart';
import '../../data/entities/login_response.dart';
import '../../data/entities/register_customer_response.dart';
import '../../data/entities/register_seller_response.dart';
import '../../data/entities/reset_password_response.dart';
import '../../data/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginResponse>> login(
      {required String phoneNumber, required String password});

  Future<Either<Failure, RegisterSellerResponse>> registerSeller(
      {required String username,
      required String phoneNumber,
      required String tradeRegister,
      required String taxId,
      required String password,
      required String locationId,
      required XFile registerImg});

  Future<Either<Failure, RegisterCustomerResponse>> registerCustomer(
      {required String username,
      required String phoneNumber,
      required String password});

  Future<Either<Failure, ResetPasswordResponse>> resetPassword(
      {required String newPassword, required String phoneNumber});

  Future<Either<Failure, void>> sendOtp({required String phoneNumber});

  Future<Either<Failure, void>> confirmOtp({required String otp});

  Future<Either<Failure,void>> setUser(UserEntity user);

  Future<Either<Failure,UserEntity>> getUser();

  Future<Either<Failure,UserEntity>> updateUser(UserEntity updatedUser);

  Future<Either<Failure,void>> deleteUser();
}
