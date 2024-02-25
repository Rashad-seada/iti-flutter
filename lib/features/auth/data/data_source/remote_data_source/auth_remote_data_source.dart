import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/core/errors/exception.dart';
import 'package:smart_soft/core/infrastructure/api/api.dart';
import 'package:path/path.dart';
import 'package:smart_soft/features/auth/data/entities/login_response.dart';
import 'package:smart_soft/features/auth/data/entities/register_seller_response.dart';

import '../../../../../core/config/app_consts.dart';

abstract class AuthRemoteDataSource {

  Future<LoginResponse> login({required String phoneNumber,required String password});

  Future<RegisterSellerResponse> registerSeller({required String username,required String phoneNumber,required String tradeRegister,required String taxId,required String password,required String locationId,required File registerImg});

  Future registerBuyer({required String username,required String phoneNumber,required String password});

  Future<void> sendOtp({required String phoneNumber});

  Future<void> confirmOtp({required String otp});

}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {

  final _auth = FirebaseAuth.instance;
  final _client = getIt<Api>();
  String _verificationId = '';

  @override
  Future<LoginResponse> login({required String phoneNumber, required String password}) async {

    try {

      Map<String,dynamic> requestData = {
        "phoneNumber": phoneNumber,
        "passWord": password
      };

      final response = await _client.post(
        AppConsts.url + AppConsts.loginEndPoint,
        data: requestData
      );

      Map<String,dynamic> responseData = json.decode(response.data);

      return LoginResponse.fromJson(requestData,);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }

  }

  @override
  Future registerBuyer({required String username, required String phoneNumber, required String password}) async {
    try {

      Map<String,dynamic> requestData = {
        "Name": username,
        "PhoneNumber": phoneNumber,
        "PassWord": password
      };

      final response = await _client.post(
          AppConsts.url + AppConsts.registerBuyerEndPoint,
          data: requestData
      );

      Map<String,dynamic> responseData = json.decode(response.data);

      //return RegistrationEntity.fromJson(requestData,response.statusCode!);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<RegisterSellerResponse> registerSeller({required String username, required String phoneNumber, required String tradeRegister, required String taxId, required String password,required String locationId,required File registerImg}) async{
    try {

      FormData formData = FormData.fromMap({
        "Name": username,
        "ComNo": tradeRegister,
        "PhoneNumber": phoneNumber,
        "TaxNo": taxId,
        "Password": password,
        "LocationId": locationId,
        'RegisterImg': await MultipartFile.fromFile(registerImg.path, filename: basename(registerImg.path)),
      });

      final response = await _client.post(
          AppConsts.url + AppConsts.registerSellerEndPoint,
          data: formData
      );

      Map<String,dynamic> responseData = json.decode(response.data);

      return RegisterSellerResponse.fromJson(responseData,);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }

  }

  @override
  Future<void> sendOtp({required String phoneNumber}) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
        },
        verificationFailed: (FirebaseAuthException e) {

          print(e.message);
          throw RemoteDataException(e.message ?? "Unknown Error happened");
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
      );
    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<void> confirmOtp({required String otp}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: _verificationId, smsCode: otp);

      final user = await _auth.signInWithCredential(credential).then((value) => value.user);

      if(user != null){
        return ;
      }else {
        throw RemoteDataException("The code is not valid");
      }

    } catch (e) {
      throw RemoteDataException(e.toString());
    }

  }


}