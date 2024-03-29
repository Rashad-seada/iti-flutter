import 'package:dartz/dartz.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/core/errors/failure.dart';
import 'package:smart_soft/features/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:smart_soft/features/home/data/entities/get_home_response.dart';
import 'package:smart_soft/features/home/domain/repo/home_repo.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/infrastructure/services/network_service.dart';

class HomeRepoImpl implements HomeRepo {

  HomeRemoteDataSource remoteDataSource = getIt<HomeRemoteDataSource>();
  NetworkService networkService = getIt<NetworkService>();


  @override
  Future<Either<Failure, GetHomeResponse>> getHome(String token) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      final homeResponse = await remoteDataSource.getHome(token);

      if (homeResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            homeResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(homeResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, GetHomeResponse>> setHomeAd({required String token, required String sellerId, required String description, required XFile image}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      final  setHomeResponse = await remoteDataSource.setHomeAd(token: token, sellerId: sellerId, description: description, image: image);

      if (setHomeResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            setHomeResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(setHomeResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }
}