

import 'package:dartz/dartz.dart';

import '../../../../core/di/app_module.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/infrastructure/services/network_service.dart';
import '../../domain/repo/variation_repo.dart';
import '../data_source/remote/variation_remote_data_source.dart';
import '../entities/get_all_sellers_response.dart';
import '../entities/get_button_response.dart';
import '../entities/get_chest_response.dart';
import '../entities/get_collar_response.dart';
import '../entities/get_embroidery_response.dart';
import '../entities/get_fabric_response.dart';
import '../entities/get_front_pocket_response.dart';
import '../entities/get_sleeve_response.dart';

class VariationRepoImpl implements VariationRepo {

  final remoteDataSource = getIt<VariationRemoteDataSource>();
  final networkService = getIt<NetworkService>();

  @override
  Future<Either<Failure, GetAllSellersResponse>> getAllSellers() async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }

      GetAllSellersResponse getAllSellersResponse = await remoteDataSource.getAllSellers();

      if (getAllSellersResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            getAllSellersResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(getAllSellersResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, GetButtonResponse>> getButtonBySellerId(int id) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      GetButtonResponse getButtonResponse = await remoteDataSource.getButtonBySellerId(id);

      if (getButtonResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            getButtonResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(getButtonResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, GetChestResponse>> getChestBySellerId(int id) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      GetChestResponse getChestResponse = await remoteDataSource.getChestBySellerId(id);

      if (getChestResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            getChestResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(getChestResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, GetCollarResponse>> getCollarBySellerId(int id) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      GetCollarResponse getCollarResponse = await remoteDataSource.getCollarBySellerId(id);

      if (getCollarResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            getCollarResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(getCollarResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }

  }

  @override
  Future<Either<Failure, GetEmbroideryResponse>> getEmbroideryBySellerId(int id) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      GetEmbroideryResponse getEmbroideryResponse = await remoteDataSource.getEmbroideryBySellerId(id);

      if (getEmbroideryResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            getEmbroideryResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(getEmbroideryResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, GetFabricResponse>> getFabricBySellerId(int id) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      GetFabricResponse getFabricResponse = await remoteDataSource.getFabricBySellerId(id);

      if (getFabricResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            getFabricResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(getFabricResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, GetFrontPocketResponse>> getFrontPocketBySellerId(int id) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      GetFrontPocketResponse getFrontPocketResponse = await remoteDataSource.getFrontPocketBySellerId(id);

      if (getFrontPocketResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            getFrontPocketResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(getFrontPocketResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, GetAllSellersResponse>> getSellersByLocationId(int id) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      GetAllSellersResponse getAllSellersResponse = await remoteDataSource.getAllSellers();

      if (getAllSellersResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            getAllSellersResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(getAllSellersResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, GetSleeveResponse>> getSleeveBySellerId(int id) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      GetSleeveResponse getSleeveResponse = await remoteDataSource.getSleeveBySellerId(id);

      if (getSleeveResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            getSleeveResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(getSleeveResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }
}