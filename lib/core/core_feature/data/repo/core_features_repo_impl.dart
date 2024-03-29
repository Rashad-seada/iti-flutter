
import 'package:dartz/dartz.dart';
import 'package:smart_soft/core/core_feature/data/data_source/local/core_features_remote_data_source.dart';

import 'package:smart_soft/core/core_feature/data/entities/get_all_cities_response.dart';

import 'package:smart_soft/core/errors/failure.dart';

import '../../../di/app_module.dart';
import '../../../errors/exception.dart';
import '../../../infrastructure/services/network_service.dart';
import '../../domain/repo/core_features_repo.dart';

class CoreFeaturesRepoImpl implements CoreFeaturesRepo {

  NetworkService networkService = getIt<NetworkService>();
  CoreFeaturesRemoteDataSource remoteDataSource = getIt<CoreFeaturesRemoteDataSource>();


  @override
  Future<Either<Failure, GetAllCitiesResponse>> getAllCities() async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }

      GetAllCitiesResponse getAllCitiesResponse = await remoteDataSource.getAllCities();

      if (getAllCitiesResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            getAllCitiesResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(getAllCitiesResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

}